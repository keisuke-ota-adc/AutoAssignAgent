#!/usr/bin/env bash
# macOS / Linux / Git Bash: Supabase CLI 用に supabase -> autoassign-supabase-cli のシンボリックリンクを作る。
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TARGET="$ROOT/autoassign-supabase-cli"
LINK="$ROOT/supabase"
if [[ ! -d "$TARGET" ]]; then
  echo "autoassign-supabase-cli が見つかりません: $TARGET" >&2
  exit 1
fi
if [[ -e "$LINK" ]] || [[ -L "$LINK" ]]; then
  if [[ -L "$LINK" ]]; then
    resolved="$(readlink "$LINK")"
    if [[ "$resolved" == "$TARGET" ]] || [[ "$resolved" == "autoassign-supabase-cli" ]]; then
      echo "シンボリックリンクは既に存在します: supabase -> autoassign-supabase-cli"
      exit 0
    fi
  fi
  echo "supabase が既に存在します。削除してから再実行してください: $LINK" >&2
  exit 1
fi
ln -s autoassign-supabase-cli "$LINK"
echo "作成しました: $LINK -> autoassign-supabase-cli"
