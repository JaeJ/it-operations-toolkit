[CmdletBinding()]
param()

. "$PSScriptRoot\..\..\..\shared\Import-ToolkitModule.ps1"

try {

    Write-ToolkitLog `
        -Message "Retrieving Microsoft 365 users."

    Get-MgUser |
    Select-Object `
        DisplayName,
        UserPrincipalName,
        AccountEnabled

}
catch {

    Write-ToolkitLog `
        -Level Error `
        -Message "Unable to retrieve Microsoft 365 users."

}