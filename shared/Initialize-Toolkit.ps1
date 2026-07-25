[CmdletBinding()]
param()

. "$PSScriptRoot\Get-ToolkitConfiguration.ps1"
. "$PSScriptRoot\Write-ToolkitLog.ps1"

Write-ToolkitLog `
    -Message "Initializing IT Operations Toolkit."

$Configuration = Get-ToolkitConfiguration

Write-ToolkitLog `
    -Message "Environment: $($Configuration.Environment)"

Write-ToolkitLog `
    -Message "Version: $($Configuration.Version)"

$Configuration