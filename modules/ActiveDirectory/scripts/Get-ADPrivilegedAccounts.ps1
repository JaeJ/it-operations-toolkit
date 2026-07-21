<#
.SYNOPSIS
Retrieves members of privileged Active Directory groups.

.DESCRIPTION
Reports members of Domain Admins and Enterprise Admins.

.EXAMPLE
Get-ADPrivilegedAccounts.ps1
#>

[CmdletBinding()]
param()

try {

    Get-ADGroupMember "Domain Admins" |
    Select-Object Name, SamAccountName

}
catch {

    Write-Error "Unable to retrieve privileged accounts."

}