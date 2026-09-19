[CmdletBinding()]
param()

$Overview = & "$PSScriptRoot\Get-ToolkitOverview.ps1"

$Output = Join-Path `
    $PSScriptRoot `
    "..\examples\ToolkitInventory.csv"

$Overview |
    Export-Csv `
        -Path $Output `
        -NoTypeInformation

Write-Output "Inventory exported to $Output"