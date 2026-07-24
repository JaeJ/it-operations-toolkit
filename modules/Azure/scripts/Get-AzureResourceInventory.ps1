[CmdletBinding()]
param()

. "$PSScriptRoot\..\..\..\shared\Import-ToolkitModule.ps1"

try {

    Write-ToolkitLog `
        -Message "Retrieving Azure resource inventory."

    Get-AzResource |
    Select-Object `
        Name,
        ResourceType,
        Location,
        ResourceGroupName

}
catch {

    Write-ToolkitLog `
        -Level Error `
        -Message "Unable to retrieve Azure resources."

}