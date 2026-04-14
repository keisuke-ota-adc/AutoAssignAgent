# Supabase CLI はプロジェクトルート直下の supabase/config.toml を探すため、
# autoassign-supabase-cli/ を supabase という名前のディレクトリジャンクションで見せる。
# 使い方: リポジトリルートで powershell -File scripts/link-supabase-cli-junction.ps1
$ErrorActionPreference = "Stop"
$repoRoot = Split-Path -Parent $PSScriptRoot
$target = Join-Path $repoRoot "autoassign-supabase-cli"
$link = Join-Path $repoRoot "supabase"

if (-not (Test-Path $target)) {
    Write-Error "autoassign-supabase-cli が見つかりません: $target"
}

if (Test-Path $link) {
    $item = Get-Item $link -Force
    if ($item.Attributes -band [System.IO.FileAttributes]::ReparsePoint) {
        $ok = $false
        if ($item.LinkType -eq "Junction") {
            $jt = $item.Target
            if ($jt -is [System.Array]) { $jt = $jt[0] }
            $want = [System.IO.Path]::GetFullPath($target)
            $got = [System.IO.Path]::GetFullPath([string]$jt)
            if ([string]::Equals($got, $want, [System.StringComparison]::OrdinalIgnoreCase)) {
                $ok = $true
            }
        }
        if ($ok) {
            Write-Host "OK: junction already exists (supabase -> autoassign-supabase-cli)"
            exit 0
        }
        Write-Error "supabase が別の再解析ポイントです。削除してから再実行してください: $link"
    }
    Write-Error "supabase が既に存在します（通常フォルダまたはファイル）。退避または削除してから再実行してください: $link"
}

cmd /c "mklink /J `"$link`" `"$target`""
Write-Host "OK: created junction $link -> $target"
