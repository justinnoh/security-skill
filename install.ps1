# Installs the security-skill into the user's Claude Code skills directory on Windows.
# Usage (from the repo root):
#   powershell -ExecutionPolicy Bypass -File .\install.ps1
$ErrorActionPreference = 'Stop'

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$Src = Join-Path $ScriptDir 'security-skill'
$Dest = Join-Path $env:USERPROFILE '.claude\skills'

if (-not (Test-Path $Src)) {
    Write-Error "Cannot find skill source at $Src"
    exit 1
}

New-Item -ItemType Directory -Force -Path $Dest | Out-Null

$Target = Join-Path $Dest 'security-skill'
if (Test-Path $Target) {
    Write-Host "Removing existing install at $Target"
    Remove-Item -Recurse -Force $Target
}

Copy-Item -Recurse -Force $Src $Dest

Write-Host "Installed security-skill to $Target"
Write-Host "Start a new Claude Code session and run: /security-skill"
