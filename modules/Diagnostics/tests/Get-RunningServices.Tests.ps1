Describe "Get-RunningServices Script" {

    It "Script Exists" {

        $ScriptPath = Join-Path $PSScriptRoot "..\scripts\Get-RunningServices.ps1"

        Test-Path $ScriptPath | Should -BeTrue

    }

}