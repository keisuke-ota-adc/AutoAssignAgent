import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2.49.1";

const corsHeaders: Record<string, string> = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers": "authorization, x-client-info, apikey, content-type",
};

type CreateProjectBody = {
  name: string;
  customer_id?: string | null;
  customer_name?: string | null;
  description?: string | null;
  main_status_id: string;
  sub_status_id: string;
  sales_employee_id?: string | null;
  period_start?: string | null;
  period_end?: string | null;
};

Deno.serve(async (req) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { headers: corsHeaders });
  }

  const url = Deno.env.get("SUPABASE_URL");
  const key = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
  if (!url || !key) {
    return new Response(
      JSON.stringify({ error: "Missing SUPABASE_URL or SUPABASE_SERVICE_ROLE_KEY" }),
      { status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" } },
    );
  }

  const supabase = createClient(url, key);

  if (req.method === "GET") {
    const { data, error } = await supabase
      .schema("project")
      .from("project_with_customer_name")
      .select("*")
      .order("id");
    if (error) {
      return new Response(JSON.stringify({ error: error.message }), {
        status: 500,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }
    return new Response(JSON.stringify(data ?? []), {
      headers: { ...corsHeaders, "Content-Type": "application/json" },
    });
  }

  if (req.method === "POST") {
    let body: CreateProjectBody;
    try {
      body = (await req.json()) as CreateProjectBody;
    } catch {
      return new Response(JSON.stringify({ error: "Invalid JSON body" }), {
        status: 400,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }

    if (!body.name || !body.main_status_id || !body.sub_status_id) {
      return new Response(JSON.stringify({ error: "name, main_status_id and sub_status_id are required" }), {
        status: 400,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }

    let customerId = body.customer_id ?? null;
    if (!customerId && body.customer_name) {
      const newCustomerId = crypto.randomUUID();
      const { error: customerErr } = await supabase
        .schema("project")
        .from("customer")
        .insert({ id: newCustomerId, name: body.customer_name });
      if (customerErr) {
        return new Response(JSON.stringify({ error: customerErr.message }), {
          status: 400,
          headers: { ...corsHeaders, "Content-Type": "application/json" },
        });
      }
      customerId = newCustomerId;
    }

    if (!customerId) {
      return new Response(JSON.stringify({ error: "customer_id or customer_name is required" }), {
        status: 400,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }

    const id = crypto.randomUUID();
    const row = {
      id,
      name: body.name,
      customer_id: customerId,
      description: body.description ?? null,
      main_status_id: body.main_status_id,
      sub_status_id: body.sub_status_id,
      sales_employee_id: body.sales_employee_id ?? null,
      period_start: body.period_start ?? null,
      period_end: body.period_end ?? null,
    };

    const { data, error } = await supabase
      .schema("project")
      .from("project")
      .insert(row)
      .select()
      .single();
    if (error) {
      return new Response(JSON.stringify({ error: error.message }), {
        status: 400,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }
    return new Response(JSON.stringify(data), {
      status: 201,
      headers: { ...corsHeaders, "Content-Type": "application/json" },
    });
  }

  return new Response(JSON.stringify({ error: "Method not allowed" }), {
    status: 405,
    headers: { ...corsHeaders, "Content-Type": "application/json" },
  });
});
