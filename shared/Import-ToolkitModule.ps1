[CmdletBinding()]
param()

$SharedFunctions = @(
    "Write-ToolkitLog.ps1",
    "Get-ToolkitConfiguration.ps1",
    "Initialize-Toolkit.ps1"
)

foreach ($Function in $SharedFunctions) {

    $Path = Join-Path $PSScriptRoot $Function

    if (Test-Path $Path) {

        . $Path

    }

}