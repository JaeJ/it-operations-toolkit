Describe "Get-AzureResourceInventory Script" {

    It "Script Exists" {

        $ScriptPath = Join-Path $PSScriptRoot "..\scripts\Get-AzureResourceInventory.ps1"

        Test-Path $ScriptPath | Should -BeTrue

    }

}