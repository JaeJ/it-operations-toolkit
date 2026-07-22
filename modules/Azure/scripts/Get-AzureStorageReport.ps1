[CmdletBinding()]
param()

try {

    Get-AzStorageAccount |
    Select-Object `
        StorageAccountName,
        Location,
        ResourceGroupName

}
catch {

    Write-Error "Unable to retrieve Azure storage accounts."

}