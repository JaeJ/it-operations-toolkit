[CmdletBinding()]
param(

    [string]$OutputPath = "$PSScriptRoot\..\examples\ToolkitDashboard.html"

)

$OverviewScript = Join-Path `
    $PSScriptRoot `
    "Get-ToolkitOverview.ps1"

$ToolkitData = & $OverviewScript

$Html = $ToolkitData |
    ConvertTo-Html `
        -Title "IT Operations Toolkit Dashboard" `
        -PreContent "<h1>IT Operations Toolkit Dashboard</h1>" `
        -PostContent "<p>Generated: $(Get-Date)</p>"

$Html |
    Set-Content `
        -Path $OutputPath

Write-Output "Dashboard exported to $OutputPath"
