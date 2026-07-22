[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [object]$InputObject,

    [Parameter(Mandatory)]
    [string]$Path
)

$InputObject | Export-Csv -Path $Path -NoTypeInformation