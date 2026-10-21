<#
.SYNOPSIS
    Синхронизирует локальный клон памяти с GitHub.

.DESCRIPTION
    1. git pull --rebase — забирает изменения с GitHub поверх локальных коммитов.
    2. git push        — отправляет локальные коммиты.

    При ошибке push скрипт завершается с ненулевым кодом.
#>
$ErrorActionPreference = 'Stop'

$repoRoot = Split-Path -Parent $PSScriptRoot
Set-Location $repoRoot

Write-Host '==> git pull --rebase' -ForegroundColor Cyan
git pull --rebase
if ($LASTEXITCODE -ne 0) {
    Write-Host 'pull failed' -ForegroundColor Red
    exit $LASTEXITCODE
}

Write-Host '==> git push' -ForegroundColor Cyan
git push
if ($LASTEXITCODE -ne 0) {
    Write-Host 'push failed: check network and repository access rights' -ForegroundColor Red
    exit $LASTEXITCODE
}

Write-Host 'OK: memory synced' -ForegroundColor Green
