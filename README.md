# AutoAssignAgent

ドメインモデルと PostgreSQL 物理スキーマ、Supabase を使った仮実装（DB・Edge Functions）を置いています。

## レイアウト

| パス | 内容 |
|------|------|
| [db/rdb-schema-postgresql.sql](db/rdb-schema-postgresql.sql) | DDL の単一ソース（汎用 PostgreSQL） |
| [supabase/migrations/](supabase/migrations/) | Supabase 向けマイグレーション（`pgcrypto` は `extensions` スキーマ） |
| [supabase/seed.sql](supabase/seed.sql) | 開発用シード（固定 UUID のマスタと role / staff / employee） |
| [supabase/functions/](supabase/functions/) | Edge Functions（`health`, `projects`） |

## 前提

- [Supabase CLI](https://supabase.com/docs/guides/cli)（`npx supabase` でも可）
- ローカルで `supabase start` または `supabase db reset` を使う場合は Docker

## Docker なしでクラウドのみ（新規プロジェクトと DB 作成）

このリポジトリの DB を作るだけなら **Docker Desktop は不要**です。手順は次のとおりです。

1. [Supabase](https://supabase.com/dashboard) にアクセスし、**New project** で新規プロジェクトを作成する（組織・リージョン・データベースのパスワードを設定）。
2. プロジェクトが作成されると、ホスト上の PostgreSQL（マネージド）が用意されます。ローカルは使わない。
3. このリポジトリで CLI をログインし、リモートにリンクする。

```powershell
cd c:\Users\keisuke-ota\Documents\AutoAssignAgent
npx supabase login
npx supabase link --project-ref YOUR_PROJECT_REF
```

4. `YOUR_PROJECT_REF` は **Project Settings > General** の **Reference ID**（Project URL の `https://xxxx.supabase.co` の `xxxx` 部分）。

5. マイグレーションをリモートに適用する（Docker なしで API 経由で実行される）。

```powershell
npx supabase db push
```

6. 開発用シードを流す（任意）。CLI のリモート実行を使う。

```powershell
npx supabase db query --linked -f supabase/seed.sql
```

シードを手で実行したい場合は、ダッシュボードの **SQL Editor** に `supabase/seed.sql` の内容を貼り付けて実行しても同じです。

7. 拡張のエラーが出た場合のみ、**Database > Extensions** で `pgcrypto` を有効にしてからマイグレーションを再実行する。

## DB の適用（補足）

- **クラウドだけ使う場合**: 手順は「Docker なしでクラウドのみ」を参照（`db push` と `db query --linked -f supabase/seed.sql`）。
- **ローカルで Postgres を動かす場合**（Docker を使う場合のみ）:

```powershell
npx supabase start
npx supabase db reset
```

## Edge Functions のシークレット

Functions は `SUPABASE_SERVICE_ROLE_KEY` で DB に接続します。リモートでは次で登録します。

```powershell
npx supabase secrets set SUPABASE_SERVICE_ROLE_KEY=your-service-role-key --project-ref YOUR_PROJECT_REF
```

`SUPABASE_URL` はホスト側で自動注入されることが多いですが、エラーになる場合は同様に `secrets set` で設定してください。

ローカル実行ではリポジトリ直下に `.env` を用意します（`.env.example` をコピー）。

```powershell
copy .env.example .env
```

`.env` に `SUPABASE_URL` と `SUPABASE_SERVICE_ROLE_KEY` を記入したうえで:

```powershell
npx supabase functions serve --env-file ..\\.env
```

作業ディレクトリは `supabase` 配下になる場合があるため、パスは環境に合わせて調整してください。プロジェクトルートから:

```powershell
npx supabase functions serve --env-file .env
```

## デプロイ

```powershell
npx supabase functions deploy health
npx supabase functions deploy projects
```

## 動作確認（curl）

デプロイ後の URL は `https://YOUR_PROJECT_REF.supabase.co/functions/v1/health` 形式です。

```powershell
curl -s https://YOUR_PROJECT_REF.supabase.co/functions/v1/health
curl -s https://YOUR_PROJECT_REF.supabase.co/functions/v1/projects
```

案件の作成（シードのステータス UUID を使用）:

```powershell
curl -s -X POST https://YOUR_PROJECT_REF.supabase.co/functions/v1/projects -H "Content-Type: application/json" -d "{\"main_status_id\":\"22222222-2222-4222-8222-222222222201\",\"sub_status_id\":\"22222222-2222-4222-8222-222222222202\",\"customer_name\":\"Demo\"}"
```

## セキュリティメモ

- Edge Functions の `verify_jwt` は仮実装のため無効化しています。本番前に認可を必ず設計してください。
- サービスロールキーはクライアントに埋め込まないでください。ブラウザからは anon key のみを想定し、API は Functions 経由に限定してください。
