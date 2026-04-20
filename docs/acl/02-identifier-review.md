# 02. 識別子レビュー（自然キー依存の見直し）

> Hackolade モデルで、ACL が **自然キー（名前など）で上流に結びついている箇所** を洗い出し、安定した外部 ID に置き換える方針を決める。

## 問題のある結び付き

### `ACL_Customer.Customer_Name` → `Project.Customer_Name`

Hackolade リレーション `fk ACL_Customer.Customer_Name to Project.Customer_Name` は、**顧客名（表記文字列）そのものをキー**として参照している。

- **何が起きるか**
  - 顧客名を「株式会社 A」→「A 株式会社」へ表記揺れ修正するだけで、参照が壊れる。
  - 同名の別顧客が登場したとき、区別できない。
- **本質的な原因**
  - 顧客は本来独立した **Acter（Ac）** で、プロジェクトからは「どの顧客か」を **ID** で指すべき。現状モデルは `Project.customer_name` しか持っておらず、顧客マスタが存在しない。

### `Employee.Name` や `Staff.Display_Name` のコピー

`ACL_Staff.Display_Name` や `ACL_Employee_Sales.Name` は表示目的のコピーで、**参照キーではない**ので原則問題は少ない。ただし、
- 改姓・表記揺れがあったとき、**ACL の表示が古いまま** になる。
- 個人情報保護の観点で、下流にどこまで氏名を保持するかの方針が要る。

## 方針

### 顧客の扱い: 顧客マスタを新設し、UUID で参照する

- **`project` スキーマに `customer` テーブルを新設**（ドメインはプロジェクト）。
  - 実装スコープ（現時点）: `id UUID PK`, `name TEXT` のみ。
- **`project.project` に `customer_id UUID REFERENCES customer(id)` を追加**。既存の `customer_name` はビューの表示用コピーとして残してよいが、**正は `customer_id`**。
- **`project.acl_customer` には `customer_id` を主キーにする**。`name` はコピー列。

この変更は **`project` コンテキスト内の強化**であり、ACL が安心してコピーできる **安定 ID の用意**を目的とする。

### スタッフ・社員の氏名コピー: 「表示用」と明記

- ACL には **`display_name`**（または `name`）のコピーを許可するが、**表示専用で結合に使わない**ことをコメントと運用で徹底する。
- 個人情報方針
  - コピー列は上流で削除・マスキングされた場合、**定期再投影またはイベントで追従**する（同期方式は [05-sync-poc.md](05-sync-poc.md) 参照）。
  - 法的要請（削除請求など）がある場合の反映 SLA を運用で定義。

### 共有マスタ `Role` の扱い

- `Role` は全コンテキスト共通の「汎用コード表」として扱い、**ACL 経由ではなく直接参照**を許容する。
  - 物理配置: `hr.role`（現状 `role`）をそのまま参照。
  - ただし、ACL の列に `role_name` を表示コピーする場合は、上流変更時の追従を [03-acl-contract.md](03-acl-contract.md) の契約表に明記する。
- **もし将来、ロール名を案件ドメインで独自に持ちたいケースが出た**ら、その時点で `project` スキーマに独自コード表を新設する（今は不要）。

## 判断一覧（識別子）

| 識別子 | 現状 | 採用方針 | 理由（Why） |
|--------|------|----------|-------------|
| 顧客 | `Project.customer_name` のみ | `project.customer(id UUID)` を新設し、`project.customer_id` で参照 | 表記揺れ・同名問題で壊れない。ACL も安定 ID を持てる |
| スタッフ | `staff.id UUID` が既にある | 既存どおり。ACL にも `staff_id` を UUID で保持 | 問題なし |
| 社員（営業） | `employee.id UUID` が既にある | 既存どおり。`project.acl_employee_sales.employee_id` | 問題なし |
| 要員依頼 | `staffing_order.id UUID` が既にある | 既存どおり。`work_assignment.acl_staffing_order.staffing_order_id` | 問題なし |
| プロジェクト | `project.id UUID` が既にある | 既存どおり | 問題なし |
| ロール | `role.id UUID` が既にある | 共有マスタとして直接参照（ACL を通さない） | 全コンテキスト共通のコード表 |

## やらないこと

- **名前をキーに使い続ける**ことはやめる。ACL の `name` / `display_name` / `customer_name` は **表示のみ**。
- 名前に `UNIQUE` 制約を強制する案は採らない（表記揺れの吸収余地を残すため）。
