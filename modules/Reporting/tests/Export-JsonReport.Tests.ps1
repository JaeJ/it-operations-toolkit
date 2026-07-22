Describe "Export-JsonReport Script" {

    It "Script Exists" {

        $ScriptPath = Join-Path $PSScriptRoot "..\scripts\Export-JsonReport.ps1"

        Test-Path $ScriptPath | Should -BeTrue

    }

}