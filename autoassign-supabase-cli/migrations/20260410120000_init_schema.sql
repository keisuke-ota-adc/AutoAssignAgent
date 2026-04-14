-- AutoAssignAgent: Supabase 初期スキーマ（db/rdb-schema-postgresql.sql と同一 DDL。拡張のみ extensions スキーマ）
-- 前提: UUID 主キー・FK、期間は親の period_start / period_end、月別工数は子テーブル、
--       ステータスはマスタ Id を FK で参照、添付は BYTEA

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA extensions;

-- ---------------------------------------------------------------------------
-- ロール
-- ---------------------------------------------------------------------------
CREATE TABLE role (
    id          UUID PRIMARY KEY,
    name        TEXT NOT NULL
);

-- ---------------------------------------------------------------------------
-- スタッフ（Employee / Business_Partner の共通先）
-- ---------------------------------------------------------------------------
CREATE TABLE staff (
    id               UUID PRIMARY KEY,
    display_name     TEXT,
    role_id          UUID NOT NULL REFERENCES role (id),
    staff_category   TEXT NOT NULL,
    CONSTRAINT staff_staff_category_chk
        CHECK (staff_category IN ('Employee', 'Business_Partner'))
);

CREATE INDEX idx_staff_role_id ON staff (role_id);

-- ---------------------------------------------------------------------------
-- 社員・取引先担当（いずれも staff を参照）
-- ---------------------------------------------------------------------------
CREATE TABLE employee (
    id         UUID PRIMARY KEY,
    staff_id   UUID NOT NULL REFERENCES staff (id),
    name       TEXT NOT NULL,
    number     INTEGER,
    grade      TEXT,
    role_id    UUID NOT NULL REFERENCES role (id)
);

CREATE INDEX idx_employee_staff_id ON employee (staff_id);
CREATE INDEX idx_employee_role_id ON employee (role_id);

CREATE TABLE business_partner (
    id         UUID PRIMARY KEY,
    staff_id   UUID NOT NULL REFERENCES staff (id),
    name       TEXT,
    number     INTEGER,
    role_id    UUID NOT NULL REFERENCES role (id)
);

CREATE INDEX idx_business_partner_staff_id ON business_partner (staff_id);
CREATE INDEX idx_business_partner_role_id ON business_partner (role_id);

-- ---------------------------------------------------------------------------
-- ステータスマスタ（StaffingOrder）
-- ---------------------------------------------------------------------------
CREATE TABLE main_status_staffing_order (
    id          UUID PRIMARY KEY,
    name        TEXT,
    sort_order  INTEGER
);

CREATE TABLE sub_status_staffing_order (
    id               UUID PRIMARY KEY,
    main_status_id   UUID NOT NULL REFERENCES main_status_staffing_order (id),
    name             TEXT,
    sort_order       INTEGER
);

CREATE INDEX idx_sub_status_staffing_order_main ON sub_status_staffing_order (main_status_id);

-- ---------------------------------------------------------------------------
-- ステータスマスタ（Project）
-- ---------------------------------------------------------------------------
CREATE TABLE main_status_project (
    id          UUID PRIMARY KEY,
    name        TEXT,
    sort_order  INTEGER
);

CREATE TABLE sub_status_project (
    id               UUID PRIMARY KEY,
    main_status_id   UUID NOT NULL REFERENCES main_status_project (id),
    name             TEXT,
    sort_order       INTEGER
);

CREATE INDEX idx_sub_status_project_main ON sub_status_project (main_status_id);

-- ---------------------------------------------------------------------------
-- ステータスマスタ（WorkAssignment）
-- ---------------------------------------------------------------------------
CREATE TABLE main_status_work_assignment (
    id          UUID PRIMARY KEY,
    name        TEXT,
    sort_order  INTEGER
);

CREATE TABLE sub_status_work_assignment (
    id               UUID PRIMARY KEY,
    main_status_id   UUID NOT NULL REFERENCES main_status_work_assignment (id),
    name             TEXT,
    sort_order       INTEGER
);

CREATE INDEX idx_sub_status_work_assignment_main ON sub_status_work_assignment (main_status_id);

-- ---------------------------------------------------------------------------
-- スタッフ状態マスタ
-- ---------------------------------------------------------------------------
CREATE TABLE status_staff (
    id          UUID PRIMARY KEY,
    name        TEXT,
    sort_order  INTEGER
);

-- ---------------------------------------------------------------------------
-- 案件
-- ---------------------------------------------------------------------------
CREATE TABLE project (
    id                   UUID PRIMARY KEY,
    sales_employee_id    UUID REFERENCES employee (id),
    customer_name        TEXT,
    description          TEXT,
    period_start         DATE,
    period_end           DATE,
    attachments          BYTEA,
    main_status_id       UUID NOT NULL REFERENCES main_status_project (id),
    sub_status_id        UUID NOT NULL REFERENCES sub_status_project (id)
);

CREATE INDEX idx_project_sales_employee_id ON project (sales_employee_id);
CREATE INDEX idx_project_main_status_id ON project (main_status_id);
CREATE INDEX idx_project_sub_status_id ON project (sub_status_id);

-- ---------------------------------------------------------------------------
-- 予約（StaffingOrder）
-- ---------------------------------------------------------------------------
CREATE TABLE staffing_order (
    id                UUID PRIMARY KEY,
    project_id        UUID NOT NULL REFERENCES project (id),
    period_start      DATE,
    period_end        DATE,
    description       TEXT,
    attachments       BYTEA,
    total_amount      INTEGER,
    main_status_id    UUID NOT NULL REFERENCES main_status_staffing_order (id),
    sub_status_id     UUID NOT NULL REFERENCES sub_status_staffing_order (id)
);

CREATE INDEX idx_staffing_order_project_id ON staffing_order (project_id);
CREATE INDEX idx_staffing_order_main_status_id ON staffing_order (main_status_id);
CREATE INDEX idx_staffing_order_sub_status_id ON staffing_order (sub_status_id);

-- ---------------------------------------------------------------------------
-- 予約あたりの要員リソース明細
-- ---------------------------------------------------------------------------
CREATE TABLE staffing_order_staff_resource (
    staffing_order_id   UUID NOT NULL REFERENCES staffing_order (id) ON DELETE CASCADE,
    staff_id              UUID NOT NULL REFERENCES staff (id),
    role_id               UUID NOT NULL REFERENCES role (id),
    amount                INTEGER,
    PRIMARY KEY (staffing_order_id, staff_id)
);

CREATE INDEX idx_sosr_role_id ON staffing_order_staff_resource (role_id);

CREATE TABLE staffing_order_staff_resource_monthly_allocation (
    staffing_order_id   UUID NOT NULL,
    staff_id            UUID NOT NULL,
    year_month          DATE NOT NULL,
    effort              DOUBLE PRECISION NOT NULL,
    PRIMARY KEY (staffing_order_id, staff_id, year_month),
    FOREIGN KEY (staffing_order_id, staff_id)
        REFERENCES staffing_order_staff_resource (staffing_order_id, staff_id)
        ON DELETE CASCADE
);

-- ---------------------------------------------------------------------------
-- 作業割当
-- ---------------------------------------------------------------------------
CREATE TABLE work_assignment (
    id                   UUID PRIMARY KEY,
    staffing_order_id    UUID NOT NULL REFERENCES staffing_order (id),
    project_id           UUID NOT NULL REFERENCES project (id),
    staff_id             UUID NOT NULL REFERENCES staff (id),
    period_start         DATE,
    period_end           DATE,
    main_status_id       UUID NOT NULL REFERENCES main_status_work_assignment (id),
    sub_status_id        UUID NOT NULL REFERENCES sub_status_work_assignment (id)
);

CREATE INDEX idx_work_assignment_staffing_order ON work_assignment (staffing_order_id);
CREATE INDEX idx_work_assignment_project ON work_assignment (project_id);
CREATE INDEX idx_work_assignment_staff ON work_assignment (staff_id);
CREATE INDEX idx_work_assignment_main_status ON work_assignment (main_status_id);
CREATE INDEX idx_work_assignment_sub_status ON work_assignment (sub_status_id);

CREATE TABLE work_assignment_monthly_allocation (
    work_assignment_id   UUID NOT NULL REFERENCES work_assignment (id) ON DELETE CASCADE,
    year_month           DATE NOT NULL,
    effort               DOUBLE PRECISION NOT NULL,
    PRIMARY KEY (work_assignment_id, year_month)
);

-- ---------------------------------------------------------------------------
-- スタッフごとの状態履歴（Hackolade: StaffStatus）
-- ---------------------------------------------------------------------------
CREATE TABLE staff_status (
    id                        UUID PRIMARY KEY,
    staff_id                  UUID NOT NULL REFERENCES staff (id),
    status_id                 UUID NOT NULL REFERENCES status_staff (id),
    status_period_start       DATE,
    status_period_end         DATE,
    status_valid_period_start DATE,
    status_valid_period_end   DATE
);

CREATE INDEX idx_staff_status_staff_id ON staff_status (staff_id);
CREATE INDEX idx_staff_status_status_id ON staff_status (status_id);
