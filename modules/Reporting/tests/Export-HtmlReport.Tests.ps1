[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [object]$InputObject,

    [Parameter(Mandatory)]
    [string]$Path
)

$InputObject |
    ConvertTo-Html |
    Set-Content -Path $Path