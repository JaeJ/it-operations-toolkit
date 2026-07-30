[CmdletBinding()]
param()

. "$PSScriptRoot\Get-ToolkitConfiguration.ps1"
. "$PSScriptRoot\Write-ToolkitLog.ps1"

try {

    Write-ToolkitLog `
        -Message "Initializing IT Operations Toolkit."

    $Configuration = Get-ToolkitConfiguration

    Write-ToolkitLog `
        -Message "Environment: $($Configuration.Environment)"

    Write-ToolkitLog `
        -Message "Version: $($Configuration.Version)"

    if (-not $Configuration.LogPath) {

        Write-ToolkitLog `
            -Level Warning `
            -Message "LogPath is not configured."

    }

    if (-not $Configuration.ReportPath) {

        Write-ToolkitLog `
            -Level Warning `
            -Message "ReportPath is not configured."

    }

    Write-ToolkitLog `
        -Message "Toolkit initialization completed successfully."

    $Configuration

}
catch {

    Write-ToolkitLog `
        -Level Error `
        -Message "Toolkit initialization failed."

}
