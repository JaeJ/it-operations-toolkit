Describe "Get-M365Licenses Script" {

    It "Script Exists" {

        $ScriptPath = Join-Path $PSScriptRoot "..\scripts\Get-M365Licenses.ps1"

        Test-Path $ScriptPath | Should -BeTrue

    }

}