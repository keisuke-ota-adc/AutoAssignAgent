-- マスタ件数とシミュレーション行の参照整合（ローカルDBで手動実行用）
-- 例: psql の接続先に対して \i autoassign-supabase-cli/verify_seed.sql（CLI 用 junction 済みなら \i supabase/verify_seed.sql でも可）

SELECT 'main_status_project' AS entity, COUNT(*)::text AS cnt FROM main_status_project
UNION ALL SELECT 'sub_status_project', COUNT(*)::text FROM sub_status_project
UNION ALL SELECT 'main_status_staffing_order', COUNT(*)::text FROM main_status_staffing_order
UNION ALL SELECT 'sub_status_staffing_order', COUNT(*)::text FROM sub_status_staffing_order
UNION ALL SELECT 'main_status_work_assignment', COUNT(*)::text FROM main_status_work_assignment
UNION ALL SELECT 'sub_status_work_assignment', COUNT(*)::text FROM sub_status_work_assignment
UNION ALL SELECT 'status_staff', COUNT(*)::text FROM status_staff
UNION ALL SELECT 'role', COUNT(*)::text FROM role
UNION ALL SELECT 'staff', COUNT(*)::text FROM staff
UNION ALL SELECT 'employee', COUNT(*)::text FROM employee
UNION ALL SELECT 'business_partner', COUNT(*)::text FROM business_partner
UNION ALL SELECT 'project', COUNT(*)::text FROM project
UNION ALL SELECT 'staffing_order', COUNT(*)::text FROM staffing_order
UNION ALL SELECT 'work_assignment', COUNT(*)::text FROM work_assignment
UNION ALL SELECT 'staff_status', COUNT(*)::text FROM staff_status;

SELECT p.id AS project_id, mp.name AS project_main, sp.name AS project_sub
FROM project p
JOIN main_status_project mp ON mp.id = p.main_status_id
JOIN sub_status_project sp ON sp.id = p.sub_status_id
WHERE p.id = '66666666-6666-4666-8666-666666660001';

SELECT w.id AS work_assignment_id, mw.name AS wa_main, sw.name AS wa_sub, so.id AS staffing_order_id
FROM work_assignment w
JOIN main_status_work_assignment mw ON mw.id = w.main_status_id
JOIN sub_status_work_assignment sw ON sw.id = w.sub_status_id
JOIN staffing_order so ON so.id = w.staffing_order_id
ORDER BY w.id;
