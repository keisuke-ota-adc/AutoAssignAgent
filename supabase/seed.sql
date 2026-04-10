-- 開発用シード（固定 UUID）。本番では流さないか、マスタを差し替えること。

-- ステータスマスタ（Project / StaffingOrder / WorkAssignment / status_staff）
INSERT INTO main_status_project (id, name, sort_order)
VALUES ('22222222-2222-4222-8222-222222222201', 'Open', 1);

INSERT INTO sub_status_project (id, main_status_id, name, sort_order)
VALUES ('22222222-2222-4222-8222-222222222202', '22222222-2222-4222-8222-222222222201', 'Draft', 1);

INSERT INTO main_status_staffing_order (id, name, sort_order)
VALUES ('33333333-3333-4333-8333-333333333301', 'Planned', 1);

INSERT INTO sub_status_staffing_order (id, main_status_id, name, sort_order)
VALUES ('33333333-3333-4333-8333-333333333302', '33333333-3333-4333-8333-333333333301', 'Tentative', 1);

INSERT INTO main_status_work_assignment (id, name, sort_order)
VALUES ('44444444-4444-4444-8444-444444444401', 'Active', 1);

INSERT INTO sub_status_work_assignment (id, main_status_id, name, sort_order)
VALUES ('44444444-4444-4444-8444-444444444402', '44444444-4444-4444-8444-444444444401', 'Assigned', 1);

INSERT INTO status_staff (id, name, sort_order)
VALUES ('55555555-5555-4555-8555-555555555501', 'Available', 1);

-- role -> staff -> employee
INSERT INTO role (id, name)
VALUES ('11111111-1111-4111-8111-111111111101', 'Dev Role');

INSERT INTO staff (id, display_name, role_id, staff_category)
VALUES ('11111111-1111-4111-8111-111111111102', 'Seed Staff', '11111111-1111-4111-8111-111111111101', 'Employee');

INSERT INTO employee (id, staff_id, name, number, grade, role_id)
VALUES ('11111111-1111-4111-8111-111111111103', '11111111-1111-4111-8111-111111111102', 'Seed Employee', 1001, NULL, '11111111-1111-4111-8111-111111111101');
