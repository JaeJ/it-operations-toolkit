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

    $ToolkitData = & $OverviewScript

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

.healthy {
    color: green;
    font-weight: bold;
}

.warning {
    color: darkorange;
    font-weight: bold;
}

.critical {
    color: red;
    font-weight: bold;
}
</style>
"@

    $ReportRows = foreach ($Module in $ToolkitData) {

        [PSCustomObject]@{
            Module        = $Module.Module
            ScriptCount   = $Module.ScriptCount
            TestCount     = $Module.TestCount
            Health        = $Module.Health
            MaturityScore = "$($Module.MaturityScore)%"
        }

    }

    $Html = $ReportRows |
        ConvertTo-Html `
            -Head $Style `
            -Title "IT Operations Toolkit Dashboard" `
            -PreContent "<h1>IT Operations Toolkit Dashboard</h1>" `
            -PostContent "<p>Generated: $(Get-Date)</p>"

    $Html |
        Set-Content `
            -Path $OutputPath

    Write-ToolkitLog `
        -Message "Dashboard exported successfully."

}
catch {

    Write-ToolkitLog `
        -Level Error `
        -Message "Dashboard export failed."

}