-- AutoAssignAgent PostgreSQL reference DDL (schema-per-context)
-- 実適用の正は autoassign-supabase-cli/migrations/20260420160000_rebuild_acl_outbox.sql

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA extensions;

CREATE SCHEMA IF NOT EXISTS hr;
CREATE SCHEMA IF NOT EXISTS project;
CREATE SCHEMA IF NOT EXISTS staffing_request;
CREATE SCHEMA IF NOT EXISTS work_assignment;

-- このファイルは参照用です。
-- 実際のテーブル・関数・トリガ・RLS・Outbox 実装は
-- autoassign-supabase-cli/migrations/20260420160000_rebuild_acl_outbox.sql を参照してください。
