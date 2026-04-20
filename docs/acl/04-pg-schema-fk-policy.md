# 04. PostgreSQL スキーマ分割と FK ポリシー

> Supabase（PostgreSQL）上で、コンテキスト境界を **スキーマ** と **FK の有無** でどう表現するかを定める。

## 結論

- **スキーマを 4 つに分ける**: `hr`, `project`, `staffing_request`, `work_assignment`。
- **ACL テーブルから上流への FK は張らない**（論理参照のみ）。
- **共有マスタ（`hr.role`）** は、全スキーマから **物理 FK で直接参照**してよい。
- **同一スキーマ内の整合性** は従来どおり物理 FK で強制する。

---

## スキーマ配置

```
hr                         # 要員（スタッフ・社員・BP・ロール）
├─ role                    # 共有マスタ（全スキーマから直接参照 OK）
├─ staff
├─ employee
├─ business_partner
├─ status_staff
└─ staff_status

project                    # 案件
├─ customer                # NEW: 顧客マスタ
├─ project
├─ main_status_project
├─ sub_status_project
├─ acl_employee_sales      # 営業担当の投影（hr.employee → project）
└─ acl_customer            # 顧客の投影（project.customer → project）

staffing_request           # 要員依頼
├─ staffing_order
├─ staffing_order_item
├─ main_status_staffing_order
├─ sub_status_staffing_order
├─ acl_project             # 案件の投影（project.project → staffing_request）
└─ acl_staff               # スタッフの投影（hr.staff → staffing_request）

work_assignment            # 稼働割当
├─ work_assignment
├─ work_assignment_monthly_allocation
├─ main_status_work_assignment
├─ sub_status_work_assignment
├─ acl_staffing_order      # 要員依頼の投影（staffing_request → work_assignment）
├─ acl_project             # 案件の投影（project → work_assignment）
└─ acl_staff               # スタッフの投影（hr → work_assignment）
```

## FK ポリシー

### 原則

| 方向 | FK を張るか | 理由 |
|------|------------|------|
| **同一スキーマ内** | **張る** | 集約内の整合性（状態マスタとトランザクション、親子テーブル）は DB に任せる |
| **共有マスタ `hr.role` への参照** | **張る（例外）** | 汎用コード表の削除・改名は稀で、全コンテキストが一致するべき |
| **ACL → 上流実体**（例: `staffing_request.acl_project.project_id` → `project.project.id`） | **張らない** | 境界を越える依存を物理制約で固めると、デプロイ・マイグレーション・削除が上流に縛られる |
| **下流実体 → 上流実体**（直接 JOIN） | **張らない**（代わりに ACL を経由） | 「他ドメインのテーブルに直接依存しない」目的に反する |
| **下流実体 → 下流 ACL**（例: `work_assignment.work_assignment.project_id` → `work_assignment.acl_project.project_id`） | **張る** | ACL は同一スキーマなので集約内整合として扱える |

### 具体例

```sql
-- OK: 同一スキーマ内の FK
ALTER TABLE staffing_request.staffing_order
  ADD CONSTRAINT staffing_order_main_status_fk
  FOREIGN KEY (main_status_id)
  REFERENCES staffing_request.main_status_staffing_order (id);

-- OK: 共有マスタ hr.role への直接参照
ALTER TABLE staffing_request.acl_staff
  ADD CONSTRAINT acl_staff_role_fk
  FOREIGN KEY (role_id) REFERENCES hr.role (id);

-- NG: ACL から上流実体への FK は張らない
-- ALTER TABLE staffing_request.acl_project
--   ADD CONSTRAINT acl_project_fk
--   FOREIGN KEY (project_id) REFERENCES project.project (id);

-- OK: 下流実体から下流 ACL への FK
ALTER TABLE work_assignment.work_assignment
  ADD CONSTRAINT wa_project_acl_fk
  FOREIGN KEY (project_id)
  REFERENCES work_assignment.acl_project (project_id);
```

### 「FK を張らない代わりに何で守るか」

1. **アプリ層の UPSERT パス:** ACL を埋める経路でしか書き込まない。
2. **RLS:** ACL への直接書き込みを service role 以外で遮断。
3. **整合性チェックのバッチ:** 「`acl_project.project_id` のうち、`project.project` に存在しない ID の件数」を日次で監視する（孤立検知）。
4. **テスト:** 契約テストで、上流削除時の ACL の挙動を固定する。

## インデックス

- すべての ACL 主キー相当列には PK（UUID）。
- 検索・結合に使う列（`period_start` / `period_end` / `role_id` / `customer_id` など）に B-Tree インデックス。
- 大量の上流イベントを取り込むテーブルには、`source_updated_at` に **部分インデックス**（最新 N 日）を検討。

## 型と NULL

- ID 系: `UUID NOT NULL`。
- 日付: `DATE`。
- 金額: `INTEGER`（現状の `total_amount` と合わせる。通貨単位は別途管理）。
- コピー時刻: `TIMESTAMPTZ NOT NULL DEFAULT now()`。
- ソース時刻: `TIMESTAMPTZ NULL`（上流削除後の挙動を表現するため NULL 可）。

## マイグレーション順序

スキーマ依存は次の順で解消できる。

```
1. hr
2. project (hr に依存)
3. staffing_request (project, hr に依存)
4. work_assignment (project, staffing_request, hr に依存)
```

マイグレーションファイルは、コンテキスト別に分割する（[06-cross-cutting.md](06-cross-cutting.md)）。

## Supabase 特有の注意

- `pgcrypto` は `extensions` スキーマに作成する（既存 [autoassign-supabase-cli/migrations/](../../autoassign-supabase-cli/migrations/) の慣習に合わせる）。
- Supabase Studio は既定で `public` を見るため、上記スキーマは **ユーザーに `USAGE` を付与**する必要がある（[06-cross-cutting.md](06-cross-cutting.md) の RLS と合わせて設定）。
- `search_path` をアプリごと（または環境変数で）切り替えると、誤って別スキーマに触る事故を減らせる。
