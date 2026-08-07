[CmdletBinding()]
param()

. "$PSScriptRoot\..\..\..\shared\Import-ToolkitModule.ps1"

try {

    Write-ToolkitLog `
        -Message "Retrieving Azure virtual machine inventory."

    Get-AzVM |
        Select-Object `
            Name,
            Location,
            ResourceGroupName

}
catch {

    Write-ToolkitLog `
        -Level Error `
        -Message "Unable to retrieve Azure VM information."

}