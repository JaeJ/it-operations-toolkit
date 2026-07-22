Describe "Export-CsvReport Script" {

    It "Script Exists" {

        $ScriptPath = Join-Path $PSScriptRoot "..\scripts\Export-CsvReport.ps1"

        Test-Path $ScriptPath | Should -BeTrue

    }

}