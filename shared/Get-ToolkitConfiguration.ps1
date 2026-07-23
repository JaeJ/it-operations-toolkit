[CmdletBinding()]
param()

$ConfigPath = Join-Path `
    $PSScriptRoot `
    "..\config\toolkit-config.json"

Get-Content $ConfigPath |
    ConvertFrom-Json