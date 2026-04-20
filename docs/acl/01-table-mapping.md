# 01. ACL テーブル名・スキーマ配置・命名規則

> Hackolade モデル [docs/AutoAssignAgent_Model.hck.json](../AutoAssignAgent_Model.hck.json) の `ACL_*` コレクションを、PostgreSQL（Supabase）上のテーブルに割り当てるための「対応表」。

## 原則

- **コンテナ（Hackolade の bucket）が異なれば、同名でも別テーブル**。共有しない。
- **ACL は下流コンテキストが所有する投影テーブル**。物理テーブルは下流スキーマに置く。
- 物理テーブル名は `{下流コンテキスト名}.acl_{上流コンセプト名}` の形で、責務が名前から読めるようにする。

## スキーマ（名前空間）

| PostgreSQL スキーマ | 対応する Hackolade bucket | 目的 |
|---------------------|--------------------------|------|
| `hr` | 要員（スタッフ） | `role`, `staff`, `employee`, `business_partner`, `status_staff`, `staff_status` |
| `project` | プロジェクト | `project` と関連ステータスマスタ |
| `staffing_request` | 要員依頼 | `staffing_order`, `staffing_order_item` と関連ステータスマスタ |
| `work_assignment` | 稼働割当 | `work_assignment`, `work_assignment_monthly_allocation` と関連ステータスマスタ |

> `staffing_request` は、本プランで **要員依頼** に用語を合わせるための名称（以前の「予約」と同義）。

## ACL テーブル割り当て

Hackolade 上に同名 `ACL_*` が複数バケットにある場合は、**下表のとおり別テーブル** とする。

| # | Hackolade のコレクション (bucket) | PostgreSQL テーブル | 上流コンテキスト | 主キー | 備考 |
|---|-----------------------------------|---------------------|------------------|--------|------|
| 1 | `ACL_Project` (要員依頼) | `staffing_request.acl_project` | `project.project` | `project_id` | `polyglotOnly: true` のため **本 RDB 設計に採用するか要判断**（後述） |
| 2 | `ACL_Staff` (要員依頼) | `staffing_request.acl_staff` | `hr.staff` | `staff_id` | 同上。要員依頼の明細で使う表示コピー |
| 3 | `ACL_StaffingOrder` (稼働割当) | `work_assignment.acl_staffing_order` | `staffing_request.staffing_order` | `staffing_order_id` | 稼働割当が「どの要員依頼から生成されたか」を保持 |
| 4 | `ACL_Project` (稼働割当) | `work_assignment.acl_project` | `project.project` | `project_id` | 稼働割当表示用。`staffing_request.acl_project` と同名でも **別テーブル** |
| 5 | `ACL_Staff` (稼働割当) | `work_assignment.acl_staff` | `hr.staff` | `staff_id` | 稼働割当表示用。同上 |
| 6 | `ACL_Employee_Sales` (プロジェクト) | `project.acl_employee_sales` | `hr.employee` | `employee_id` | 案件の「営業担当」を要員コンテキストから写す |
| 7 | `ACL_Customer` (プロジェクト) | `project.acl_customer` | 顧客マスタ（未実装） | `customer_id`（導入予定） | 現状は `customer_name` のみだが、**安定 ID を導入** する方針（→ [02-identifier-review.md](02-identifier-review.md)） |

### `polyglotOnly: true` の扱い

Hackolade で `polyglotOnly: true` の定義（`ACL_Project`・`ACL_Staff` の一部）は、複数データベース対象の共通図を描くための論理的マーカーである。本 RDB 設計では次のとおり扱う。

- **採用:** 要員依頼側の `staffing_request.acl_project` / `staffing_request.acl_staff` は、要員依頼の画面・処理に必要なコピーとして **物理化する**。
- **理由:** 要員依頼明細（`staffing_order_item`）の表示では、案件名・スタッフ表示名が必須で、毎回上流 JOIN を避けたいため。
- **例外:** もし今後「要員依頼は常に上流を API 経由で引く」と決めた場合のみ、これらを RDB から落とす（その場合は表の行 1・2 を `-` に変更する）。

## 列命名

- **上流の UUID はそのまま保持**。例: `project_id UUID`, `staff_id UUID`。
- **コピー列はプレフィックスを付けない**。例: `name`, `description`, `period_start`。列名だけで「どの表のものか」は迷わないため（スキーマ＋テーブル名で十分）。
- **スナップショット時刻**は共通列 `copied_at TIMESTAMPTZ NOT NULL DEFAULT now()` を全 ACL 表に置く。
- **ソース版管理**のために `source_updated_at TIMESTAMPTZ`（上流の `updated_at` を写した値）を必要に応じて置く。

## Hackolade コレクションとの対応

- Hackolade 側の論理名（例: `ACL_Project`）は **ER 図上の識別名** として残す。物理テーブル名はスキーマで区別するため、**両立は可能**。
- もし混乱を避けたければ、Hackolade 側のコレクション名を `ACL_Project_SR` / `ACL_Project_WA` のようにリネームしてもよい（任意）。

## 不採用にした案

| 案 | 概要 | 不採用理由 |
|----|------|------------|
| 単一共有 `acl.project_snapshot` | 全コンテキストが読む 1 枚のテーブル | コンテキストごとに列集合・同期規則・ライフサイクルが異なり、責務が曖昧になる |
| コンテキスト名のプレフィックスのみ（`sr_acl_project`）でスキーマ分割しない | すべて `public` に置く | 名前空間が肥大化し、権限・マイグレーション境界が引けない |
| ACL を上流スキーマに置く（例: `project.acl_project_for_sr`） | 上流側で全部管理 | 更新責務が逆転する。下流が欲しい形に上流が縛られる |
