[CmdletBinding()]
param()

. "$PSScriptRoot\..\..\..\shared\Import-ToolkitModule.ps1"

try {

    Write-ToolkitLog `
        -Message "Retrieving running services."

    Get-Service |
        Where-Object Status -eq 'Running' |
        Select-Object `
            Name,
            DisplayName,
            Status

}
catch {

    Write-ToolkitLog `
        -Level Error `
        -Message "Unable to retrieve running services."

}