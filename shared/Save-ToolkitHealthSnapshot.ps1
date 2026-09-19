[CmdletBinding()]
param()

$SnapshotPath = Join-Path `
    $PSScriptRoot `
    "..\data\HealthHistory.json"

$Dashboard = & "$PSScriptRoot\New-ToolkitDashboard.ps1"

$Dashboard |
    ConvertTo-Json |
    Set-Content `
        -Path $SnapshotPath

Write-Output "Health snapshot saved."