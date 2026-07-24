[CmdletBinding()]
param()

. "$PSScriptRoot\..\..\..\shared\Import-ToolkitModule.ps1"

try {

    Write-ToolkitLog `
        -Message "Retrieving Active Directory users."

    Get-ADUser -Filter * |
    Select-Object `
        Name,
        SamAccountName,
        Enabled,
        LastLogonDate

}
catch {

    Write-ToolkitLog `
        -Level Error `
        -Message "Unable to retrieve Active Directory users."

}