Describe "Get-ADGroups Script" {

    It "Script Exists" {

        $ScriptPath = Join-Path $PSScriptRoot "..\scripts\Get-ADGroups.ps1"

        Test-Path $ScriptPath | Should -BeTrue

    }

}