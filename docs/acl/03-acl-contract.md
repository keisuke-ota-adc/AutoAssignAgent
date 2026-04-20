# 03. ACL 契約書（列・ソース・更新トリガ・許容ラグ）

> 各 ACL テーブルについて、次の 4 点を定義する。
>
> - どの列を持つか（コピー範囲）
> - **ソース・オブ・トゥルース（SoT）**: その列の正は誰か
> - **更新トリガ**: いつ ACL を更新するか
> - **許容ラグ**: SoT と ACL の差がどれだけ遅れて良いか

すべての ACL 共通列 `copied_at TIMESTAMPTZ NOT NULL DEFAULT now()` と、必要に応じた `source_updated_at TIMESTAMPTZ` を前提とする。

---

## 読み方

- **列**: ACL テーブルの物理列名。
- **SoT**: 「どの表のどの列」が正か。形式は `schema.table.column`。
- **更新トリガ**: `作成時のみ` / `上流イベント時` / `バッチ` / それらの組合せ。
- **許容ラグ**: `即時（同一 Tx）` / `< 1 min` / `< 1 day` / `無制限（固定）`。
- **読み取り専用**: ACL から見ると常に `YES`。

---

## 3.1 `staffing_request.acl_project`

**目的:** 要員依頼の画面・処理が、案件の基本属性を上流 JOIN なしで扱えるようにする。

| 列 | 型 | SoT | 更新トリガ | 許容ラグ | メモ |
|----|----|-----|-----------|----------|------|
| `project_id` | UUID PK | `project.project.id` | 要員依頼作成時（固定） | 無制限（固定） | 上流で削除されても ID はそのまま残す |
| `name` | TEXT | `project.project.name` | 上流イベント時 + 日次バッチ | `< 1 day` | 表示のみ |
| `description` | TEXT | `project.project.description` | 上流イベント時 + 日次バッチ | `< 1 day` | 表示のみ |
| `period_start` | DATE | `project.project.period_start` | 上流イベント時 | `< 1 min` | 依頼期間の妥当性に使うため鮮度高め |
| `period_end` | DATE | `project.project.period_end` | 上流イベント時 | `< 1 min` | 同上 |
| `customer_name` | TEXT | `project.customer.name` → `project.project.customer_id` を辿って取得 | 上流イベント時 + 日次バッチ | `< 1 day` | 表示のみ |
| `copied_at` | TIMESTAMPTZ | ACL 自身 | 自動（更新時） | - | 監視・デバッグ用 |
| `source_updated_at` | TIMESTAMPTZ | 上流の更新時刻 | 上流イベント時 | - | 同期の逆転検知に使用 |

**含めない列:** `attachments`（BYTEA）。容量が大きく、要員依頼では不要。必要なら Storage 経由のパスだけをコピーする。

---

## 3.2 `staffing_request.acl_staff`

**目的:** 要員依頼明細（誰をどのロールで予約するか）で、スタッフ表示と役割検証ができるようにする。

| 列 | 型 | SoT | 更新トリガ | 許容ラグ | メモ |
|----|----|-----|-----------|----------|------|
| `staff_id` | UUID PK | `hr.staff.id` | 依頼明細作成時（固定） | 無制限（固定） | |
| `display_name` | TEXT | `hr.staff.display_name` | 上流イベント時 + 日次バッチ | `< 1 day` | 表示のみ。氏名変更は追従 |
| `role_id` | UUID | `hr.staff.role_id` | 上流イベント時 | `< 1 min` | **共有マスタ `hr.role` を直接参照**。ACL の意味は「依頼時点でのロール」 |
| `copied_at` | TIMESTAMPTZ | ACL 自身 | 自動 | - | |
| `source_updated_at` | TIMESTAMPTZ | `hr.staff.updated_at`（導入予定） | 上流イベント時 | - | |

**メモ:** ロールは汎用コード表のため、`role_id` を持てば十分（名前はいつでも `hr.role` から引ける）。

---

## 3.3 `work_assignment.acl_staffing_order`

**目的:** 稼働割当が「どの要員依頼から生成されたか」を参照し、集計・表示できるようにする。

| 列 | 型 | SoT | 更新トリガ | 許容ラグ | メモ |
|----|----|-----|-----------|----------|------|
| `staffing_order_id` | UUID PK | `staffing_request.staffing_order.id` | 稼働割当生成時（固定） | 無制限（固定） | |
| `period_start` | DATE | `staffing_request.staffing_order.period_start` | 生成時 + イベント | `< 1 min` | 稼働側で期間整合性の判定に使うため鮮度高め |
| `period_end` | DATE | `staffing_request.staffing_order.period_end` | 生成時 + イベント | `< 1 min` | 同上 |
| `description` | TEXT | `staffing_request.staffing_order.description` | 生成時 + 日次バッチ | `< 1 day` | 表示のみ |
| `total_amount` | INT | `staffing_request.staffing_order.total_amount` | 生成時 + イベント | `< 1 day` | 表示・集計 |
| `copied_at` | TIMESTAMPTZ | ACL 自身 | 自動 | - | |

**削除挙動:** 要員依頼が取消されても、稼働割当が既に動いていれば ACL 行は **残す**（論理削除フラグは導入しない。状態は上流の要員依頼ステータスに委ねる）。

---

## 3.4 `work_assignment.acl_project`

**目的:** 稼働割当画面で案件名・期間を上流 JOIN なしで表示する。

| 列 | 型 | SoT | 更新トリガ | 許容ラグ | メモ |
|----|----|-----|-----------|----------|------|
| `project_id` | UUID PK | `project.project.id` | 稼働割当生成時（固定） | 無制限（固定） | |
| `name` | TEXT | `project.project.name` | 上流イベント時 + 日次バッチ | `< 1 day` | 表示のみ |
| `customer_name` | TEXT | `project.customer.name` | 上流イベント時 + 日次バッチ | `< 1 day` | 表示のみ |
| `period_start` | DATE | `project.project.period_start` | 上流イベント時 | `< 1 min` | |
| `period_end` | DATE | `project.project.period_end` | 上流イベント時 | `< 1 min` | |
| `copied_at` | TIMESTAMPTZ | ACL 自身 | 自動 | - | |

**`staffing_request.acl_project` との差:** 要員依頼側は `description` も表示するが、稼働側の画面では不要なので含めない（コンテキスト別に列集合が違うことの具体例）。

---

## 3.5 `work_assignment.acl_staff`

**目的:** 稼働割当画面で「誰が稼働しているか」を表示する。

| 列 | 型 | SoT | 更新トリガ | 許容ラグ | メモ |
|----|----|-----|-----------|----------|------|
| `staff_id` | UUID PK | `hr.staff.id` | 稼働割当生成時（固定） | 無制限（固定） | |
| `display_name` | TEXT | `hr.staff.display_name` | 上流イベント時 + 日次バッチ | `< 1 day` | |
| `role_id` | UUID | `hr.staff.role_id` | 上流イベント時 | `< 1 min` | `hr.role` 共有参照 |
| `copied_at` | TIMESTAMPTZ | ACL 自身 | 自動 | - | |

---

## 3.6 `project.acl_employee_sales`

**目的:** 案件が「誰を営業担当として割り当てているか」を自己完結で持つ。

| 列 | 型 | SoT | 更新トリガ | 許容ラグ | メモ |
|----|----|-----|-----------|----------|------|
| `employee_id` | UUID PK | `hr.employee.id` | 案件作成・担当変更時 | 無制限（固定） | |
| `name` | TEXT | `hr.employee.name` | 上流イベント時 + 日次バッチ | `< 1 day` | 表示のみ |
| `copied_at` | TIMESTAMPTZ | ACL 自身 | 自動 | - | |

**メモ:** `role_id`（営業ロール）は案件側の制約で固定。ACL にコピーする必要は薄いので **列を持たない**（役割マスタは必要なら `hr.role` を直接参照）。

---

## 3.7 `project.acl_customer`

**目的:** 案件が顧客名を安定的に表示する。**顧客マスタ（`project.customer`）新設が前提**。

| 列 | 型 | SoT | 更新トリガ | 許容ラグ | メモ |
|----|----|-----|-----------|----------|------|
| `customer_id` | UUID PK | `project.customer.id` | 案件作成・変更時 | 無制限（固定） | |
| `name` | TEXT | `project.customer.name` | 上流イベント時 + 日次バッチ | `< 1 day` | 表示のみ。`Project.customer_name` は廃止予定（ビューで残してよい） |
| `copied_at` | TIMESTAMPTZ | ACL 自身 | 自動 | - | |

**メモ:** `project` スキーマ**内**の ACL のため、物理的には同一スキーマだが、顧客は別ドメインの概念なのでコピーしておく。境界が将来外に動いたときの安全策。

---

## 共通ルール

### 読み取り専用

- ACL 表は **アプリからの直接 UPDATE/INSERT を禁止** する。
- 更新経路は「Outbox（同一 Tx で記録） -> Supabase Database Webhook -> Edge Function -> ACL UPSERT」のみ。
- 実装段階では RLS でも `SELECT` だけを許容する（[06-cross-cutting.md](06-cross-cutting.md)）。

### 上流削除時の挙動

| 状況 | ACL の扱い |
|------|-----------|
| 上流レコードが論理削除（`is_active=false` 等） | ACL は **残す**。表示は上流ステータスと組み合わせて判定 |
| 上流レコードが物理削除 | ACL は **残す**が、`source_updated_at` を `NULL` に更新し、監視で検知 |
| 参照元（稼働割当など）が無効化 | ACL 行は参照元と共に **残す**（履歴として） |

### 冪等性

- 同じ上流イベントを二度適用しても結果が変わらない（UPSERT 実装）。
- `source_updated_at` が既存より古ければ無視する（遅延配達対策）。

### 許容ラグ超過時

- `< 1 min` 系列でラグが超えたらアラート。
- `< 1 day` 系列は日次バッチで救済。超過 2 回連続でアラート。
