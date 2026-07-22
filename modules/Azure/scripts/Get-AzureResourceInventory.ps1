[CmdletBinding()]
param()

try {

    Get-AzResource |
    Select-Object `
        Name,
        ResourceType,
        Location,
        ResourceGroupName

}
catch {

    Write-Error "Unable to retrieve Azure resources."

}