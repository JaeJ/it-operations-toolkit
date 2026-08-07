[CmdletBinding()]
param()

. "$PSScriptRoot\Get-ToolkitConfiguration.ps1"
. "$PSScriptRoot\Write-ToolkitLog.ps1"

$Configuration = Get-ToolkitConfiguration

$OverviewScript = Join-Path `
    $PSScriptRoot `
    "Get-ToolkitOverview.ps1"

try {

    if (-not (Test-Path $Configuration.ReportPath)) {

        New-Item `
            -Path $Configuration.ReportPath `
            -ItemType Directory `
            -Force | Out-Null

    }

    $OutputPath = Join-Path `
        $Configuration.ReportPath `
        "ToolkitDashboard.html"

    Write-ToolkitLog `
        -Message "Generating Toolkit Dashboard."

    $ToolkitData = & $OverviewScript

    $ModuleCount = $ToolkitData.Count

    $HealthyModules = (
        $ToolkitData |
        Where-Object Health -eq "Healthy"
    ).Count

    $ReviewModules = (
        $ToolkitData |
        Where-Object Health -eq "Review"
    ).Count

    $Style = @"
<style>
body {
    font-family: Segoe UI, Arial, sans-serif;
    background-color: #f4f6f8;
    margin: 30px;
}

h1 {
    color: #0078D4;
}

.summary {
    display: flex;
    gap: 15px;
    margin-bottom: 20px;
}

.card {
    background: white;
    padding: 15px;
    border-left: 5px solid #0078D4;
    box-shadow: 0px 2px 4px rgba(0,0,0,.15);
    min-width: 180px;
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

    $Header = @"
<h1>IT Operations Toolkit Dashboard</h1>

<div class='summary'>
<div class='card'><strong>Modules</strong><br>$ModuleCount</div>
<div class='card'><strong>Healthy</strong><br>$HealthyModules</div>
<div class='card'><strong>Review</strong><br>$ReviewModules</div>
<div class='card'><strong>Environment</strong><br>$($Configuration.Environment)</div>
</div>
"@

    $Html = $ToolkitData |
        ConvertTo-Html `
            -Head $Style `
            -Title "IT Operations Toolkit Dashboard" `
            -PreContent $Header `
            -PostContent "<p>Generated: $(Get-Date)</p>"

    $Html |
        Set-Content `
            -Path $OutputPath

    Write-ToolkitLog `
        -Message "Dashboard exported successfully to $OutputPath."

}
catch {

    Write-ToolkitLog `
        -Level Error `
        -Message "Dashboard export failed."

}