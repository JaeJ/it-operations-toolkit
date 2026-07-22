Describe "Get-M365Users Script" {

    It "Script Exists" {

        $ScriptPath = Join-Path $PSScriptRoot "..\scripts\Get-M365Users.ps1"

        Test-Path $ScriptPath | Should -BeTrue

    }

}