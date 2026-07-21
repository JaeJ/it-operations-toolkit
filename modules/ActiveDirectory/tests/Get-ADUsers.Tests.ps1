Describe "Get-ADUsers Script" {

    It "Script Exists" {

        $ScriptPath = Join-Path $PSScriptRoot "..\scripts\Get-ADUsers.ps1"

        Test-Path $ScriptPath | Should -BeTrue

    }

}