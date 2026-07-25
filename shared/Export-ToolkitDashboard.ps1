[CmdletBinding()]
param(

    [string]$OutputPath = "$PSScriptRoot\..\examples\ToolkitDashboard.html"

)

$OverviewScript = Join-Path `
    $PSScriptRoot `
    "Get-ToolkitOverview.ps1"

$ToolkitData = & $OverviewScript

$Style = @"
<style>
body {
    font-family: Segoe UI, Arial, sans-serif;
    margin: 30px;
    background-color: #f4f6f8;
}

h1 {
    color: #0078D4;
}

table {
    border-collapse: collapse;
    width: 100%;
    background-color: white;
}

th {
    background-color: #0078D4;
    color: white;
    padding: 10px;
    text-align: left;
}

td {
    padding: 8px;
    border-bottom: 1px solid #dddddd;
}

tr:nth-child(even) {
    background-color: #f2f2f2;
}
</style>
"@

$Html = $ToolkitData |
    ConvertTo-Html `
        -Head $Style `
        -Title "IT Operations Toolkit Dashboard" `
        -PreContent "<h1>IT Operations Toolkit Dashboard</h1><p>Platform Health Overview</p>" `
        -PostContent "<p>Generated: $(Get-Date)</p>"

$Html |
    Set-Content `
        -Path $OutputPath

Write-Output "Dashboard exported to $OutputPath"
