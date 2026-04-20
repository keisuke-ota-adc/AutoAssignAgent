# AutoAssignAgent

ドメインモデルと PostgreSQL 物理スキーマ、Supabase を使った仮実装（DB・Edge Functions）を置いています。開発は **ローカル Docker** 上の Supabase を前提とします。

## レイアウト

| パス | 内容 |
|------|------|
| [db/rdb-schema-postgresql.sql](db/rdb-schema-postgresql.sql) | DDL の参照用（汎用 PostgreSQL）。**適用の正はマイグレーション** |
| [autoassign-supabase-cli/migrations/](autoassign-supabase-cli/migrations/) | Supabase CLI 向けマイグレーション（`pgcrypto` は `extensions` スキーマ） |
| [autoassign-supabase-cli/config.toml](autoassign-supabase-cli/config.toml) | CLI ローカル stack のポートや [db.seed] の `sql_paths` |
| [autoassign-supabase-cli/seed.sql](autoassign-supabase-cli/seed.sql) | 開発用シード（マスタ・role / staff / employee） |
| [autoassign-supabase-cli/seed_simulation.sql](autoassign-supabase-cli/seed_simulation.sql) | トランザクション系のシミュレーション用 INSERT |
| [autoassign-supabase-cli/verify_seed.sql](autoassign-supabase-cli/verify_seed.sql) | 件数・JOIN の検証用 SQL（任意） |
| [autoassign-supabase-cli/functions/](autoassign-supabase-cli/functions/) | Edge Functions（`health`, `projects`, `outbox-dispatch`） |
| [archive/](archive/) | 置き換え済み SQL の退避（履歴参照用、適用対象外） |
| [supabase-selfhost/](supabase-selfhost/) | 公式 [Self-Hosting with Docker](https://supabase.com/docs/guides/self-hosting/docker) の Compose 一式（CLI 用の `autoassign-supabase-cli/` とは別スタック） |
| [supabase-selfhost/SETUP.ja.md](supabase-selfhost/SETUP.ja.md) | self-hosting 用メモ（起動・Windows の改行対策） |
| [scripts/fix-supabase-selfhost-lf.ps1](scripts/fix-supabase-selfhost-lf.ps1) | self-host 用シェル類の CRLF を LF に直す（任意） |

**Supabase CLI とフォルダ名**: CLI はリポジトリ直下の **`supabase/config.toml`** だけを探す実装のため、マイグレーション等の実体は **`autoassign-supabase-cli/`** に置き、作業前に [scripts/link-supabase-cli-junction.ps1](scripts/link-supabase-cli-junction.ps1)（Windows）または [scripts/link-supabase-cli-symlink.sh](scripts/link-supabase-cli-symlink.sh)（macOS / Linux）で `supabase` への junction / symlink を作成する。

## 前提

- [Docker Desktop](https://docs.docker.com/desktop/install/windows-install/)（推奨）または Docker 互換ランタイム
- [Supabase CLI](https://supabase.com/docs/guides/cli)（`npx supabase` でも可）

## ローカル環境の選び方

| 方式 | 用途の目安 |
|------|------------|
| [supabase-selfhost/](supabase-selfhost/)（Compose） | 本リポジトリではこちらを主に利用。Kong の **8000** 番台、マイグレーションは `docker exec` + `psql` や Studio の SQL Editor で適用（[SETUP.ja.md](supabase-selfhost/SETUP.ja.md)） |
| `npx supabase start`（CLI） | 公式の軽量ローカル stack。API **54321** / DB **54322** / Studio **54323**。`npx supabase db reset` でマイグレーションと seed を一括適用 |

## 新規 PC でリポジトリをクローンしたとき（例: CLI ローカル）

1. Docker Desktop を起動する。
2. リポジトリをクローンし、ルートに移動する。
3. Supabase CLI 用に `supabase` への junction / symlink を作る（上記スクリプト。未作成だと `npx supabase` がプロジェクトを認識しない）。
4. `npx supabase start` を実行する（初回はイメージの pull に時間がかかる）。
5. `npx supabase db reset` でマイグレーションと [config.toml](autoassign-supabase-cli/config.toml) の `sql_paths`（`seed.sql` → `seed_simulation.sql`）を適用する。
6. `npx supabase status` で API URL とキーを確認する。

`autoassign-supabase-cli/` が含まれるため **`supabase init` は不要**です。

## CLI ローカル（Docker Desktop）

- 初回 `start` ではコンテナイメージの **pull**（目安で約 1GB 前後）があり、数分から十数分かかることがある。
- 停止: `npx supabase stop`（データ保持）、`npx supabase stop --no-backup`（データ破棄）。
- トラブル時は [CLI ドキュメント](https://supabase.com/docs/guides/cli/getting-started) を参照。

## Self-hosting Docker（supabase-selfhost）

Kong・Auth・Storage などフル構成は [supabase-selfhost/](supabase-selfhost/) を使います。ゲートウェイは通常 **8000**。マイグレーション適用・シード・トラブルシュートは [supabase-selfhost/SETUP.ja.md](supabase-selfhost/SETUP.ja.md) を参照。

## スキーマの適用（マイグレーションと seed）

**CLI ローカル**: `npx supabase db reset` が定番。`--no-seed` で seed のみスキップ。

**self-host**: Compose 内の Postgres に、`autoassign-supabase-cli/migrations/*.sql` と `seed.sql` / `seed_simulation.sql` を手順どおり適用する（SETUP に合わせる）。

- [autoassign-supabase-cli/verify_seed.sql](autoassign-supabase-cli/verify_seed.sql) は任意。
- [db/rdb-schema-postgresql.sql](db/rdb-schema-postgresql.sql) は参照用。変更はマイグレーションに追加する。
- 旧版 SQL は [archive/](archive/) に退避しているため、適用対象は `autoassign-supabase-cli/migrations/` のみ。

## Edge Functions のシークレット（ローカル）

Functions は `SUPABASE_URL` と `SUPABASE_SERVICE_ROLE_KEY` で DB に接続します。

```powershell
copy .env.example .env
```

`.env` を編集したうえで:

```powershell
npx supabase functions serve --env-file .env
```

- **CLI ローカル**: `SUPABASE_URL` は `npx supabase status` の API URL（例: `http://127.0.0.1:54321`）。キーは `service_role`。
- **self-host**: `http://127.0.0.1:8000` と [supabase-selfhost/.env](supabase-selfhost/.env) の `SERVICE_ROLE_KEY`（ローカル専用。共有しないこと）。

## 動作確認（curl・ローカルのみ）

CLI ローカル起動後（`supabase status` の URL に合わせる）:

```powershell
curl -s http://127.0.0.1:54321/functions/v1/health
curl -s http://127.0.0.1:54321/functions/v1/projects
```

案件作成の例（[autoassign-supabase-cli/seed.sql](autoassign-supabase-cli/seed.sql) のマスタ UUID。実際の DB に合わせて置き換える）:

```powershell
curl -s -X POST http://127.0.0.1:54321/functions/v1/projects -H "Content-Type: application/json" -d "{\"name\":\"Demo Project\",\"main_status_id\":\"22222222-2222-4222-8222-222222220001\",\"sub_status_id\":\"22222222-2222-4222-8222-222222221011\",\"customer_name\":\"Demo Customer\"}"
```

self-host で Kong 経由にする場合は、上記のホストとポートを `http://127.0.0.1:8000` に読み替える。

## セキュリティメモ

- Edge Functions の `verify_jwt` は仮実装のため無効化しています。本番前に認可を必ず設計してください。
- サービスロールキーはクライアントに埋め込まないでください。
