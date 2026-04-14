-- work_assignment.sub_status_id が main_status_work_assignment を誤参照していたため修正する。
-- 既に正しい定義の環境でも DROP/ADD で冪等に近づける。
ALTER TABLE work_assignment DROP CONSTRAINT IF EXISTS work_assignment_sub_status_id_fkey;

ALTER TABLE work_assignment
    ADD CONSTRAINT work_assignment_sub_status_id_fkey
    FOREIGN KEY (sub_status_id) REFERENCES sub_status_work_assignment (id);
