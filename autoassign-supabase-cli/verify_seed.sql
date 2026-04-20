-- マスタ件数とシミュレーション行の参照整合（ローカルDBで手動実行用）
-- 例: psql の接続先に対して \i autoassign-supabase-cli/verify_seed.sql（CLI 用 junction 済みなら \i supabase/verify_seed.sql でも可）

SELECT 'project.main_status_project' AS entity, COUNT(*)::text AS cnt FROM project.main_status_project
UNION ALL SELECT 'project.sub_status_project', COUNT(*)::text FROM project.sub_status_project
UNION ALL SELECT 'staffing_request.main_status_staffing_order', COUNT(*)::text FROM staffing_request.main_status_staffing_order
UNION ALL SELECT 'staffing_request.sub_status_staffing_order', COUNT(*)::text FROM staffing_request.sub_status_staffing_order
UNION ALL SELECT 'work_assignment.main_status_work_assignment', COUNT(*)::text FROM work_assignment.main_status_work_assignment
UNION ALL SELECT 'work_assignment.sub_status_work_assignment', COUNT(*)::text FROM work_assignment.sub_status_work_assignment
UNION ALL SELECT 'hr.status_staff', COUNT(*)::text FROM hr.status_staff
UNION ALL SELECT 'hr.role', COUNT(*)::text FROM hr.role
UNION ALL SELECT 'hr.staff', COUNT(*)::text FROM hr.staff
UNION ALL SELECT 'hr.employee', COUNT(*)::text FROM hr.employee
UNION ALL SELECT 'hr.business_partner', COUNT(*)::text FROM hr.business_partner
UNION ALL SELECT 'project.customer', COUNT(*)::text FROM project.customer
UNION ALL SELECT 'project.project', COUNT(*)::text FROM project.project
UNION ALL SELECT 'staffing_request.staffing_order', COUNT(*)::text FROM staffing_request.staffing_order
UNION ALL SELECT 'work_assignment.work_assignment', COUNT(*)::text FROM work_assignment.work_assignment
UNION ALL SELECT 'hr.staff_status', COUNT(*)::text FROM hr.staff_status;

SELECT p.id AS project_id, p.name AS project_name, c.name AS customer_name, mp.name AS project_main, sp.name AS project_sub
FROM project.project p
JOIN project.customer c ON c.id = p.customer_id
JOIN project.main_status_project mp ON mp.id = p.main_status_id
JOIN project.sub_status_project sp ON sp.id = p.sub_status_id
WHERE p.id = '66666666-6666-4666-8666-666666660001';

SELECT w.id AS work_assignment_id, mw.name AS wa_main, sw.name AS wa_sub, so.id AS staffing_order_id
FROM work_assignment.work_assignment w
JOIN work_assignment.main_status_work_assignment mw ON mw.id = w.main_status_id
JOIN work_assignment.sub_status_work_assignment sw ON sw.id = w.sub_status_id
JOIN staffing_request.staffing_order so ON so.id = w.staffing_order_id
ORDER BY w.id;
