[CmdletBinding()]
param()

. "$PSScriptRoot\Get-ToolkitConfiguration.ps1"
. "$PSScriptRoot\Write-ToolkitLog.ps1"

try {

    $Configuration = Get-ToolkitConfiguration

    Write-ToolkitLog `
        -Message "Initializing IT Operations Toolkit."

    Write-ToolkitLog `
        -Message "Environment: $($Configuration.Environment)"

    Write-ToolkitLog `
        -Message "Version: $($Configuration.Version)"

    Write-ToolkitLog `
        -Message "ReportPath: $($Configuration.ReportPath)"

    Write-ToolkitLog `
        -Message "LogPath: $($Configuration.LogPath)"

    $Configuration

}
catch {

    Write-ToolkitLog `
        -Level Error `
        -Message "Toolkit initialization failed."

}