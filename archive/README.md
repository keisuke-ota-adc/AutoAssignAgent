# Archive

このディレクトリは、現行実装では適用対象外になった SQL と補助ファイルの保管場所です。

## 2026-04-20

- 目的: `hr` / `project` / `staffing_request` / `work_assignment` の 4 スキーマ再構築に伴う旧 SQL の退避。
- 現行の適用対象:
  - `autoassign-supabase-cli/migrations/20260420160000_rebuild_acl_outbox.sql`
- 退避対象:
  - `autoassign-supabase-cli/migrations/20260410120000_init_schema.sql`
  - `autoassign-supabase-cli/migrations/20260410120001_fix_work_assignment_sub_status_fk.sql`
  - `db/rdb-schema-postgresql.sql`（旧 public 版）
