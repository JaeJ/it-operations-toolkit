[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [object]$InputObject,

    [Parameter(Mandatory)]
    [string]$Path
)

$InputObject |
    ConvertTo-Json |
    Set-Content -Path $Path