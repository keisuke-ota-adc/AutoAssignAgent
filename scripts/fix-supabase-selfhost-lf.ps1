# supabase-selfhost 配下の Docker 用スクリプトを LF に揃える（Windows の CRLF 対策）
# 使い方: リポジトリルートで powershell -File scripts/fix-supabase-selfhost-lf.ps1

$repoRoot = Split-Path $PSScriptRoot -Parent
$root = Join-Path $repoRoot "supabase-selfhost\volumes"
if (-not (Test-Path $root)) {
    Write-Error "supabase-selfhost/volumes が見つかりません。"
    exit 1
}

$utf8NoBom = New-Object System.Text.UTF8Encoding $false
$files = @(
    (Join-Path $root "api\kong-entrypoint.sh"),
    (Join-Path $root "pooler\pooler.exs")
)

foreach ($p in $files) {
    if (-not (Test-Path $p)) { continue }
    $c = [System.IO.File]::ReadAllText($p)
    $c = $c -replace "`r`n", "`n" -replace "`r", "`n"
    [System.IO.File]::WriteAllText($p, $c, $utf8NoBom)
    Write-Host "LF normalized: $p"
}

Write-Host "Done."
