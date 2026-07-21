<#
.SYNOPSIS
Retrieves Active Directory groups.

.DESCRIPTION
Returns group information from Active Directory.

.EXAMPLE
Get-ADGroups.ps1
#>

[CmdletBinding()]
param()

try {

    Get-ADGroup -Filter * |
    Select-Object `
        Name,
        GroupScope,
        GroupCategory

}
catch {

    Write-Error "Unable to retrieve Active Directory groups."

}