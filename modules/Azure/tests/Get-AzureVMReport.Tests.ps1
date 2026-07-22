Describe "Get-AzureVMReport Script" {

    It "Script Exists" {

        $ScriptPath = Join-Path $PSScriptRoot "..\scripts\Get-AzureVMReport.ps1"

        Test-Path $ScriptPath | Should -BeTrue

    }

}