# Self-hosting Supabase（Docker）セットアップメモ

公式: [Self-Hosting with Docker](https://supabase.com/docs/guides/self-hosting/docker)

このディレクトリは上記手順に基づき、[supabase/supabase](https://github.com/supabase/supabase) の `docker/` をコピーしたものです。リポジトリ直下の **`autoassign-supabase-cli/`**（Supabase CLI 用の `config.toml` やマイグレーション。CLI 互換のため `supabase` は junction / symlink）とは**別物**です。

## 前提

- Docker Desktop が起動していること
- Git（クローン済みの場合は不要）

## 初回（シークレット生成と起動）

1. `.env` を用意する（初回は `docker/.env.example` をコピー済み想定）。**デフォルトのまま本番起動しないこと**（公式の警告どおり）。
2. シークレット一括生成（Git Bash 推奨）:

```text
sh ./utils/generate-keys.sh --update-env
```

3. イメージ取得と起動:

```powershell
cd supabase-selfhost
docker compose pull
docker compose up -d
```

4. 数分待ち、`docker compose ps` で各サービスが `healthy` になることを確認する。

## Windows での注意（改行コード）

`docker compose up` 後に **Kong** が `exec ... kong-entrypoint.sh: no such file or directory`、**Pooler（supavisor）** が `carriage return` 構文エラーで落ちる場合、リポジトリからコピーした `volumes/api/kong-entrypoint.sh` や `volumes/pooler/pooler.exs` が **CRLF** になっていることがあります。**LF に直してから**該当コンテナを再作成または再起動してください。

ルートの `scripts/fix-supabase-selfhost-lf.ps1` で一括変換できます。

## `.env` の `DASHBOARD_USERNAME` / `DASHBOARD_PASSWORD` を変えたあと

Kong がゲートウェイの Basic 認証に使います。**`docker compose restart` だけでは環境変数が更新されない**ことがあるため、次で Kong を作り直してください。

```powershell
cd supabase-selfhost
docker compose up -d --no-deps --force-recreate kong
```

`--no-deps` で **DB など依存コンテナは触らない**ようにすると、`POSTGRES_PASSWORD` を変えずにダッシュボード用の値だけ反映しやすいです。

## `generate-keys.sh --update-env` のあと

スクリプトは **`POSTGRES_PASSWORD` や JWT もまとめて書き換えます**。すでに Postgres のデータボリュームがある状態だと、**DB 内のロールパスワードと `.env` が一致せず**（`invalid_password` など）解析や他サービスが落ちることがあります。

- **初回起動前**だけ `generate-keys` するのが安全です。
- 既に DB がある場合は [utils/db-passwd.sh](utils/db-passwd.sh) で DB 側を合わせるか、開発用に **`docker compose down -v` でボリュームを捨ててから** 再 `up` してください（データは消えます）。
- **ダッシュボードのパスワードだけ**変えたいときは、`DASHBOARD_USERNAME` / `DASHBOARD_PASSWORD` だけ `.env` を編集し、上記の **`--no-deps --force-recreate kong`** で足りることが多いです。

## アクセス

- Studio（Basic 認証）: ブラウザで `http://localhost:8000`（`.env` の `DASHBOARD_USERNAME` / `DASHBOARD_PASSWORD`）
- REST 等のゲートウェイ: Kong 経由でポート **8000**（CLI ローカルの 54321 とは別）

## 停止・削除

```powershell
docker compose down
```

データごと消す場合は公式ドキュメントの Uninstall 節（`docker compose down -v` など）に従うこと。
