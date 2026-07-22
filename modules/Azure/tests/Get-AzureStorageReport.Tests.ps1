Describe "Get-AzureStorageReport Script" {

    It "Script Exists" {

        $ScriptPath = Join-Path $PSScriptRoot "..\scripts\Get-AzureStorageReport.ps1"

        Test-Path $ScriptPath | Should -BeTrue

    }

}