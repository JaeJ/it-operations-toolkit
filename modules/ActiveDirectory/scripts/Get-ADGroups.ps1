[CmdletBinding()]
param()

. "$PSScriptRoot\..\..\..\shared\Import-ToolkitModule.ps1"

try {

    Write-ToolkitLog `
        -Message "Retrieving Active Directory groups."

    Get-ADGroup -Filter * |
        Select-Object `
            Name,
            GroupScope,
            GroupCategory

}
catch {

    Write-ToolkitLog `
        -Level Error `
        -Message "Unable to retrieve Active Directory groups."

}