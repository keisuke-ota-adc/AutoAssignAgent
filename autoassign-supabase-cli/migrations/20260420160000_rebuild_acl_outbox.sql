-- AutoAssignAgent: schema-per-context rebuild + ACL + Transactional Outbox
-- This migration is designed for local rebuild workflows.

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA extensions;

-- Clean legacy public tables if they exist.
DROP TABLE IF EXISTS public.work_assignment_monthly_allocation CASCADE;
DROP TABLE IF EXISTS public.work_assignment CASCADE;
DROP TABLE IF EXISTS public.staffing_order_staff_resource_monthly_allocation CASCADE;
DROP TABLE IF EXISTS public.staffing_order_staff_resource CASCADE;
DROP TABLE IF EXISTS public.staffing_order CASCADE;
DROP TABLE IF EXISTS public.project CASCADE;
DROP TABLE IF EXISTS public.staff_status CASCADE;
DROP TABLE IF EXISTS public.status_staff CASCADE;
DROP TABLE IF EXISTS public.sub_status_work_assignment CASCADE;
DROP TABLE IF EXISTS public.main_status_work_assignment CASCADE;
DROP TABLE IF EXISTS public.sub_status_staffing_order CASCADE;
DROP TABLE IF EXISTS public.main_status_staffing_order CASCADE;
DROP TABLE IF EXISTS public.sub_status_project CASCADE;
DROP TABLE IF EXISTS public.main_status_project CASCADE;
DROP TABLE IF EXISTS public.business_partner CASCADE;
DROP TABLE IF EXISTS public.employee CASCADE;
DROP TABLE IF EXISTS public.staff CASCADE;
DROP TABLE IF EXISTS public.role CASCADE;

DROP SCHEMA IF EXISTS work_assignment CASCADE;
DROP SCHEMA IF EXISTS staffing_request CASCADE;
DROP SCHEMA IF EXISTS project CASCADE;
DROP SCHEMA IF EXISTS hr CASCADE;

CREATE SCHEMA hr;
CREATE SCHEMA project;
CREATE SCHEMA staffing_request;
CREATE SCHEMA work_assignment;

-- ---------------------------------------------------------------------------
-- Utilities
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION project.set_updated_at()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
  NEW.updated_at := now();
  RETURN NEW;
END;
$$;

-- ---------------------------------------------------------------------------
-- hr schema
-- ---------------------------------------------------------------------------
CREATE TABLE hr.role (
    id          UUID PRIMARY KEY,
    name        TEXT NOT NULL
);

CREATE TABLE hr.staff (
    id               UUID PRIMARY KEY,
    display_name     TEXT,
    role_id          UUID NOT NULL REFERENCES hr.role (id),
    staff_category   TEXT NOT NULL,
    created_at       TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at       TIMESTAMPTZ NOT NULL DEFAULT now(),
    CONSTRAINT staff_staff_category_chk
        CHECK (staff_category IN ('Employee', 'Business_Partner'))
);

CREATE INDEX idx_hr_staff_role_id ON hr.staff (role_id);

CREATE TABLE hr.employee (
    id          UUID PRIMARY KEY,
    staff_id    UUID NOT NULL REFERENCES hr.staff (id),
    name        TEXT NOT NULL,
    number      INTEGER,
    grade       TEXT,
    role_id     UUID NOT NULL REFERENCES hr.role (id),
    created_at  TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_hr_employee_staff_id ON hr.employee (staff_id);
CREATE INDEX idx_hr_employee_role_id ON hr.employee (role_id);

CREATE TABLE hr.business_partner (
    id          UUID PRIMARY KEY,
    staff_id    UUID NOT NULL REFERENCES hr.staff (id),
    name        TEXT,
    number      INTEGER,
    role_id     UUID NOT NULL REFERENCES hr.role (id),
    created_at  TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_hr_business_partner_staff_id ON hr.business_partner (staff_id);
CREATE INDEX idx_hr_business_partner_role_id ON hr.business_partner (role_id);

CREATE TABLE hr.status_staff (
    id          UUID PRIMARY KEY,
    name        TEXT,
    sort_order  INTEGER
);

CREATE TABLE hr.staff_status (
    id                        UUID PRIMARY KEY,
    staff_id                  UUID NOT NULL REFERENCES hr.staff (id),
    status_id                 UUID NOT NULL REFERENCES hr.status_staff (id),
    status_period_start       DATE,
    status_period_end         DATE,
    status_valid_period_start DATE,
    status_valid_period_end   DATE,
    created_at                TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at                TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_hr_staff_status_staff_id ON hr.staff_status (staff_id);
CREATE INDEX idx_hr_staff_status_status_id ON hr.staff_status (status_id);

-- ---------------------------------------------------------------------------
-- project schema
-- ---------------------------------------------------------------------------
CREATE TABLE project.main_status_project (
    id          UUID PRIMARY KEY,
    name        TEXT,
    sort_order  INTEGER
);

CREATE TABLE project.sub_status_project (
    id               UUID PRIMARY KEY,
    main_status_id   UUID NOT NULL REFERENCES project.main_status_project (id),
    name             TEXT,
    sort_order       INTEGER
);

CREATE INDEX idx_project_sub_status_project_main ON project.sub_status_project (main_status_id);

CREATE TABLE project.customer (
    id          UUID PRIMARY KEY,
    name        TEXT NOT NULL,
    created_at  TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE project.project (
    id                   UUID PRIMARY KEY,
    name                 TEXT NOT NULL,
    sales_employee_id    UUID REFERENCES hr.employee (id),
    customer_id          UUID NOT NULL REFERENCES project.customer (id),
    description          TEXT,
    period_start         DATE,
    period_end           DATE,
    attachments          BYTEA,
    main_status_id       UUID NOT NULL REFERENCES project.main_status_project (id),
    sub_status_id        UUID NOT NULL REFERENCES project.sub_status_project (id),
    created_at           TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at           TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_project_project_sales_employee_id ON project.project (sales_employee_id);
CREATE INDEX idx_project_project_customer_id ON project.project (customer_id);
CREATE INDEX idx_project_project_main_status_id ON project.project (main_status_id);
CREATE INDEX idx_project_project_sub_status_id ON project.project (sub_status_id);

CREATE VIEW project.project_with_customer_name AS
SELECT
    p.id,
    p.name,
    p.sales_employee_id,
    p.customer_id,
    c.name AS customer_name,
    p.description,
    p.period_start,
    p.period_end,
    p.attachments,
    p.main_status_id,
    p.sub_status_id,
    p.created_at,
    p.updated_at
FROM project.project p
JOIN project.customer c ON c.id = p.customer_id;

CREATE TABLE project.acl_employee_sales (
    employee_id        UUID PRIMARY KEY,
    name               TEXT,
    copied_at          TIMESTAMPTZ NOT NULL DEFAULT now(),
    source_updated_at  TIMESTAMPTZ
);

CREATE TABLE project.acl_customer (
    customer_id        UUID PRIMARY KEY,
    name               TEXT,
    copied_at          TIMESTAMPTZ NOT NULL DEFAULT now(),
    source_updated_at  TIMESTAMPTZ
);

CREATE TABLE project.outbox_event (
    id              UUID PRIMARY KEY DEFAULT extensions.gen_random_uuid(),
    aggregate_type  TEXT NOT NULL,
    aggregate_id    UUID NOT NULL,
    event_type      TEXT NOT NULL,
    payload         JSONB NOT NULL,
    occurred_at     TIMESTAMPTZ NOT NULL DEFAULT now(),
    dispatched_at   TIMESTAMPTZ,
    attempts        INT NOT NULL DEFAULT 0,
    last_error      TEXT
);

CREATE INDEX idx_project_outbox_pending
  ON project.outbox_event (occurred_at)
  WHERE dispatched_at IS NULL;

-- ---------------------------------------------------------------------------
-- staffing_request schema
-- ---------------------------------------------------------------------------
CREATE TABLE staffing_request.main_status_staffing_order (
    id          UUID PRIMARY KEY,
    name        TEXT,
    sort_order  INTEGER
);

CREATE TABLE staffing_request.sub_status_staffing_order (
    id               UUID PRIMARY KEY,
    main_status_id   UUID NOT NULL REFERENCES staffing_request.main_status_staffing_order (id),
    name             TEXT,
    sort_order       INTEGER
);

CREATE INDEX idx_sr_sub_status_staffing_order_main ON staffing_request.sub_status_staffing_order (main_status_id);

CREATE TABLE staffing_request.staffing_order (
    id                UUID PRIMARY KEY,
    project_id        UUID NOT NULL,
    period_start      DATE,
    period_end        DATE,
    description       TEXT,
    attachments       BYTEA,
    total_amount      INTEGER,
    main_status_id    UUID NOT NULL REFERENCES staffing_request.main_status_staffing_order (id),
    sub_status_id     UUID NOT NULL REFERENCES staffing_request.sub_status_staffing_order (id),
    created_at        TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at        TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_sr_staffing_order_project_id ON staffing_request.staffing_order (project_id);
CREATE INDEX idx_sr_staffing_order_main_status_id ON staffing_request.staffing_order (main_status_id);
CREATE INDEX idx_sr_staffing_order_sub_status_id ON staffing_request.staffing_order (sub_status_id);

CREATE TABLE staffing_request.staffing_order_item (
    staffing_order_id  UUID NOT NULL REFERENCES staffing_request.staffing_order (id) ON DELETE CASCADE,
    staff_id           UUID NOT NULL,
    role_id            UUID NOT NULL REFERENCES hr.role (id),
    amount             INTEGER,
    PRIMARY KEY (staffing_order_id, staff_id)
);

CREATE INDEX idx_sr_staffing_order_item_role_id ON staffing_request.staffing_order_item (role_id);

CREATE TABLE staffing_request.staffing_order_item_monthly_allocation (
    staffing_order_id   UUID NOT NULL,
    staff_id            UUID NOT NULL,
    year_month          DATE NOT NULL,
    effort              DOUBLE PRECISION NOT NULL,
    PRIMARY KEY (staffing_order_id, staff_id, year_month),
    FOREIGN KEY (staffing_order_id, staff_id)
        REFERENCES staffing_request.staffing_order_item (staffing_order_id, staff_id)
        ON DELETE CASCADE
);

CREATE TABLE staffing_request.acl_project (
    project_id         UUID PRIMARY KEY,
    name               TEXT,
    description        TEXT,
    period_start       DATE,
    period_end         DATE,
    customer_name      TEXT,
    copied_at          TIMESTAMPTZ NOT NULL DEFAULT now(),
    source_updated_at  TIMESTAMPTZ
);

CREATE TABLE staffing_request.acl_staff (
    staff_id           UUID PRIMARY KEY,
    display_name       TEXT,
    role_id            UUID REFERENCES hr.role (id),
    copied_at          TIMESTAMPTZ NOT NULL DEFAULT now(),
    source_updated_at  TIMESTAMPTZ
);

-- ---------------------------------------------------------------------------
-- work_assignment schema
-- ---------------------------------------------------------------------------
CREATE TABLE work_assignment.main_status_work_assignment (
    id          UUID PRIMARY KEY,
    name        TEXT,
    sort_order  INTEGER
);

CREATE TABLE work_assignment.sub_status_work_assignment (
    id               UUID PRIMARY KEY,
    main_status_id   UUID NOT NULL REFERENCES work_assignment.main_status_work_assignment (id),
    name             TEXT,
    sort_order       INTEGER
);

CREATE INDEX idx_wa_sub_status_work_assignment_main ON work_assignment.sub_status_work_assignment (main_status_id);

CREATE TABLE work_assignment.work_assignment (
    id                   UUID PRIMARY KEY,
    staffing_order_id    UUID NOT NULL,
    project_id           UUID NOT NULL,
    staff_id             UUID NOT NULL,
    period_start         DATE,
    period_end           DATE,
    main_status_id       UUID NOT NULL REFERENCES work_assignment.main_status_work_assignment (id),
    sub_status_id        UUID NOT NULL REFERENCES work_assignment.sub_status_work_assignment (id),
    created_at           TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at           TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_wa_work_assignment_staffing_order ON work_assignment.work_assignment (staffing_order_id);
CREATE INDEX idx_wa_work_assignment_project ON work_assignment.work_assignment (project_id);
CREATE INDEX idx_wa_work_assignment_staff ON work_assignment.work_assignment (staff_id);
CREATE INDEX idx_wa_work_assignment_main_status ON work_assignment.work_assignment (main_status_id);
CREATE INDEX idx_wa_work_assignment_sub_status ON work_assignment.work_assignment (sub_status_id);

CREATE TABLE work_assignment.work_assignment_monthly_allocation (
    work_assignment_id   UUID NOT NULL REFERENCES work_assignment.work_assignment (id) ON DELETE CASCADE,
    year_month           DATE NOT NULL,
    effort               DOUBLE PRECISION NOT NULL,
    PRIMARY KEY (work_assignment_id, year_month)
);

CREATE TABLE work_assignment.acl_staffing_order (
    staffing_order_id    UUID PRIMARY KEY,
    period_start         DATE,
    period_end           DATE,
    description          TEXT,
    total_amount         INTEGER,
    copied_at            TIMESTAMPTZ NOT NULL DEFAULT now(),
    source_updated_at    TIMESTAMPTZ
);

CREATE TABLE work_assignment.acl_project (
    project_id           UUID PRIMARY KEY,
    name                 TEXT,
    customer_name        TEXT,
    period_start         DATE,
    period_end           DATE,
    copied_at            TIMESTAMPTZ NOT NULL DEFAULT now(),
    source_updated_at    TIMESTAMPTZ
);

CREATE TABLE work_assignment.acl_staff (
    staff_id             UUID PRIMARY KEY,
    display_name         TEXT,
    role_id              UUID REFERENCES hr.role (id),
    copied_at            TIMESTAMPTZ NOT NULL DEFAULT now(),
    source_updated_at    TIMESTAMPTZ
);

-- ---------------------------------------------------------------------------
-- updated_at triggers
-- ---------------------------------------------------------------------------
CREATE TRIGGER trg_hr_staff_set_updated_at
BEFORE UPDATE ON hr.staff
FOR EACH ROW EXECUTE FUNCTION project.set_updated_at();

CREATE TRIGGER trg_hr_employee_set_updated_at
BEFORE UPDATE ON hr.employee
FOR EACH ROW EXECUTE FUNCTION project.set_updated_at();

CREATE TRIGGER trg_hr_business_partner_set_updated_at
BEFORE UPDATE ON hr.business_partner
FOR EACH ROW EXECUTE FUNCTION project.set_updated_at();

CREATE TRIGGER trg_hr_staff_status_set_updated_at
BEFORE UPDATE ON hr.staff_status
FOR EACH ROW EXECUTE FUNCTION project.set_updated_at();

CREATE TRIGGER trg_project_customer_set_updated_at
BEFORE UPDATE ON project.customer
FOR EACH ROW EXECUTE FUNCTION project.set_updated_at();

CREATE TRIGGER trg_project_project_set_updated_at
BEFORE UPDATE ON project.project
FOR EACH ROW EXECUTE FUNCTION project.set_updated_at();

CREATE TRIGGER trg_sr_staffing_order_set_updated_at
BEFORE UPDATE ON staffing_request.staffing_order
FOR EACH ROW EXECUTE FUNCTION project.set_updated_at();

CREATE TRIGGER trg_wa_work_assignment_set_updated_at
BEFORE UPDATE ON work_assignment.work_assignment
FOR EACH ROW EXECUTE FUNCTION project.set_updated_at();

-- ---------------------------------------------------------------------------
-- Outbox trigger and helper functions
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION project.enqueue_project_outbox()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
  v_customer_name TEXT;
BEGIN
  SELECT c.name INTO v_customer_name
  FROM project.customer c
  WHERE c.id = NEW.customer_id;

  INSERT INTO project.outbox_event (
    aggregate_type,
    aggregate_id,
    event_type,
    payload
  ) VALUES (
    'project',
    NEW.id,
    'project.upserted',
    jsonb_build_object(
      'id', NEW.id,
      'name', NEW.name,
      'description', NEW.description,
      'period_start', NEW.period_start,
      'period_end', NEW.period_end,
      'customer_name', COALESCE(v_customer_name, ''),
      'source_updated_at', NEW.updated_at
    )
  );

  RETURN NEW;
END;
$$;

CREATE TRIGGER trg_project_enqueue_outbox
AFTER INSERT OR UPDATE OF name, customer_id, description, period_start, period_end ON project.project
FOR EACH ROW
EXECUTE FUNCTION project.enqueue_project_outbox();

CREATE OR REPLACE FUNCTION project.update_project_name(
  p_project_id UUID,
  p_name TEXT
)
RETURNS VOID
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
BEGIN
  UPDATE project.project
  SET name = p_name
  WHERE id = p_project_id;

  IF NOT FOUND THEN
    RAISE EXCEPTION 'project not found: %', p_project_id;
  END IF;
END;
$$;

-- ---------------------------------------------------------------------------
-- Idempotent ACL upsert functions (LWW)
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION staffing_request.upsert_acl_project(
  p_project_id UUID,
  p_name TEXT,
  p_description TEXT,
  p_period_start DATE,
  p_period_end DATE,
  p_customer_name TEXT,
  p_source_updated_at TIMESTAMPTZ
)
RETURNS VOID
LANGUAGE SQL
AS $$
INSERT INTO staffing_request.acl_project AS a (
  project_id,
  name,
  description,
  period_start,
  period_end,
  customer_name,
  copied_at,
  source_updated_at
)
VALUES (
  p_project_id,
  p_name,
  p_description,
  p_period_start,
  p_period_end,
  p_customer_name,
  now(),
  p_source_updated_at
)
ON CONFLICT (project_id) DO UPDATE SET
  name = EXCLUDED.name,
  description = EXCLUDED.description,
  period_start = EXCLUDED.period_start,
  period_end = EXCLUDED.period_end,
  customer_name = EXCLUDED.customer_name,
  copied_at = now(),
  source_updated_at = EXCLUDED.source_updated_at
WHERE EXCLUDED.source_updated_at > a.source_updated_at
   OR a.source_updated_at IS NULL;
$$;

CREATE OR REPLACE FUNCTION work_assignment.upsert_acl_project(
  p_project_id UUID,
  p_name TEXT,
  p_customer_name TEXT,
  p_period_start DATE,
  p_period_end DATE,
  p_source_updated_at TIMESTAMPTZ
)
RETURNS VOID
LANGUAGE SQL
AS $$
INSERT INTO work_assignment.acl_project AS a (
  project_id,
  name,
  customer_name,
  period_start,
  period_end,
  copied_at,
  source_updated_at
)
VALUES (
  p_project_id,
  p_name,
  p_customer_name,
  p_period_start,
  p_period_end,
  now(),
  p_source_updated_at
)
ON CONFLICT (project_id) DO UPDATE SET
  name = EXCLUDED.name,
  customer_name = EXCLUDED.customer_name,
  period_start = EXCLUDED.period_start,
  period_end = EXCLUDED.period_end,
  copied_at = now(),
  source_updated_at = EXCLUDED.source_updated_at
WHERE EXCLUDED.source_updated_at > a.source_updated_at
   OR a.source_updated_at IS NULL;
$$;

-- ---------------------------------------------------------------------------
-- Fallback reconcile SQL function (enqueue resync events)
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION project.enqueue_project_acl_resync()
RETURNS INTEGER
LANGUAGE plpgsql
AS $$
DECLARE
  v_count INTEGER := 0;
BEGIN
  INSERT INTO project.outbox_event (
    aggregate_type,
    aggregate_id,
    event_type,
    payload
  )
  SELECT
    'project',
    p.id,
    'project.resync',
    jsonb_build_object(
      'id', p.id,
      'name', p.name,
      'description', p.description,
      'period_start', p.period_start,
      'period_end', p.period_end,
      'customer_name', c.name,
      'source_updated_at', p.updated_at
    )
  FROM project.project p
  JOIN project.customer c ON c.id = p.customer_id
  LEFT JOIN staffing_request.acl_project sr ON sr.project_id = p.id
  LEFT JOIN work_assignment.acl_project wa ON wa.project_id = p.id
  WHERE sr.project_id IS NULL
     OR wa.project_id IS NULL
     OR sr.source_updated_at IS NULL
     OR wa.source_updated_at IS NULL
     OR sr.source_updated_at < p.updated_at
     OR wa.source_updated_at < p.updated_at;

  GET DIAGNOSTICS v_count = ROW_COUNT;
  RETURN v_count;
END;
$$;

-- ---------------------------------------------------------------------------
-- RLS for ACL tables (read-only for authenticated)
-- ---------------------------------------------------------------------------
ALTER TABLE project.acl_customer ENABLE ROW LEVEL SECURITY;
ALTER TABLE project.acl_employee_sales ENABLE ROW LEVEL SECURITY;
ALTER TABLE staffing_request.acl_project ENABLE ROW LEVEL SECURITY;
ALTER TABLE staffing_request.acl_staff ENABLE ROW LEVEL SECURITY;
ALTER TABLE work_assignment.acl_staffing_order ENABLE ROW LEVEL SECURITY;
ALTER TABLE work_assignment.acl_project ENABLE ROW LEVEL SECURITY;
ALTER TABLE work_assignment.acl_staff ENABLE ROW LEVEL SECURITY;

CREATE POLICY acl_customer_select_authenticated
  ON project.acl_customer
  FOR SELECT
  TO authenticated
  USING (true);

CREATE POLICY acl_employee_sales_select_authenticated
  ON project.acl_employee_sales
  FOR SELECT
  TO authenticated
  USING (true);

CREATE POLICY sr_acl_project_select_authenticated
  ON staffing_request.acl_project
  FOR SELECT
  TO authenticated
  USING (true);

CREATE POLICY sr_acl_staff_select_authenticated
  ON staffing_request.acl_staff
  FOR SELECT
  TO authenticated
  USING (true);

CREATE POLICY wa_acl_staffing_order_select_authenticated
  ON work_assignment.acl_staffing_order
  FOR SELECT
  TO authenticated
  USING (true);

CREATE POLICY wa_acl_project_select_authenticated
  ON work_assignment.acl_project
  FOR SELECT
  TO authenticated
  USING (true);

CREATE POLICY wa_acl_staff_select_authenticated
  ON work_assignment.acl_staff
  FOR SELECT
  TO authenticated
  USING (true);

-- API visibility for new schemas.
GRANT USAGE ON SCHEMA hr TO authenticated, anon;
GRANT USAGE ON SCHEMA project TO authenticated, anon;
GRANT USAGE ON SCHEMA staffing_request TO authenticated, anon;
GRANT USAGE ON SCHEMA work_assignment TO authenticated, anon;
