import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2.49.1";

const corsHeaders: Record<string, string> = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers": "authorization, x-client-info, apikey, content-type, x-webhook-secret",
};

type OutboxPayload = {
  id: string;
  name?: string | null;
  description?: string | null;
  period_start?: string | null;
  period_end?: string | null;
  customer_name?: string | null;
  source_updated_at?: string | null;
};

type WebhookBody = {
  record?: { id?: string };
  new?: { id?: string };
  id?: string;
};

function getEventId(body: WebhookBody): string | null {
  return body.record?.id ?? body.new?.id ?? body.id ?? null;
}

Deno.serve(async (req) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { headers: corsHeaders });
  }

  const url = Deno.env.get("SUPABASE_URL");
  const key = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
  if (!url || !key) {
    return new Response(JSON.stringify({ ok: false, error: "Missing SUPABASE_URL or SUPABASE_SERVICE_ROLE_KEY" }), {
      status: 500,
      headers: { ...corsHeaders, "Content-Type": "application/json" },
    });
  }

  const supabase = createClient(url, key);

  let eventId: string | null = null;
  if (req.method === "POST") {
    try {
      const body = (await req.json()) as WebhookBody;
      eventId = getEventId(body);
    } catch {
      return new Response(JSON.stringify({ ok: false, error: "Invalid webhook payload" }), {
        status: 400,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }
  }

  if (!eventId) {
    const { data: pendingRows, error: pendingErr } = await supabase
      .schema("project")
      .from("outbox_event")
      .select("id")
      .is("dispatched_at", null)
      .order("occurred_at", { ascending: true })
      .limit(1);

    if (pendingErr) {
      return new Response(JSON.stringify({ ok: false, error: pendingErr.message }), {
        status: 500,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }
    eventId = pendingRows?.[0]?.id ?? null;
  }

  if (!eventId) {
    return new Response(JSON.stringify({ ok: true, message: "no pending events" }), {
      status: 200,
      headers: { ...corsHeaders, "Content-Type": "application/json" },
    });
  }

  const { data: eventRows, error: eventErr } = await supabase
    .schema("project")
    .from("outbox_event")
    .select("*")
    .eq("id", eventId)
    .limit(1);

  if (eventErr) {
    return new Response(JSON.stringify({ ok: false, error: eventErr.message }), {
      status: 500,
      headers: { ...corsHeaders, "Content-Type": "application/json" },
    });
  }

  const eventRow = eventRows?.[0];
  if (!eventRow) {
    return new Response(JSON.stringify({ ok: true, message: "event not found" }), {
      status: 200,
      headers: { ...corsHeaders, "Content-Type": "application/json" },
    });
  }

  if (eventRow.dispatched_at) {
    return new Response(JSON.stringify({ ok: true, message: "already dispatched", id: eventId }), {
      status: 200,
      headers: { ...corsHeaders, "Content-Type": "application/json" },
    });
  }

  const payload = eventRow.payload as OutboxPayload;
  const sourceUpdatedAt = payload.source_updated_at ?? new Date().toISOString();

  try {
    if (eventRow.event_type === "project.upserted" || eventRow.event_type === "project.resync") {
      const common = {
        p_project_id: payload.id,
        p_name: payload.name ?? null,
        p_period_start: payload.period_start ?? null,
        p_period_end: payload.period_end ?? null,
        p_source_updated_at: sourceUpdatedAt,
      };

      const { error: srErr } = await supabase.schema("staffing_request").rpc("upsert_acl_project", {
        ...common,
        p_description: payload.description ?? null,
        p_customer_name: payload.customer_name ?? null,
      });

      if (srErr) {
        throw srErr;
      }

      const { error: waErr } = await supabase.schema("work_assignment").rpc("upsert_acl_project", {
        ...common,
        p_customer_name: payload.customer_name ?? null,
      });

      if (waErr) {
        throw waErr;
      }
    }

    const { error: doneErr } = await supabase
      .schema("project")
      .from("outbox_event")
      .update({
        dispatched_at: new Date().toISOString(),
      })
      .eq("id", eventId);

    if (doneErr) {
      throw doneErr;
    }

    return new Response(JSON.stringify({ ok: true, id: eventId }), {
      status: 200,
      headers: { ...corsHeaders, "Content-Type": "application/json" },
    });
  } catch (error) {
    const message = error instanceof Error ? error.message : String(error);
    await supabase
      .schema("project")
      .from("outbox_event")
      .update({
        attempts: (eventRow.attempts ?? 0) + 1,
        last_error: message,
      })
      .eq("id", eventId);

    return new Response(JSON.stringify({ ok: false, id: eventId, error: message }), {
      status: 500,
      headers: { ...corsHeaders, "Content-Type": "application/json" },
    });
  }
});
