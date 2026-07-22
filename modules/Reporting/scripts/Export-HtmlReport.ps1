Describe "Export-HtmlReport Script" {

    It "Script Exists" {

        $ScriptPath = Join-Path $PSScriptRoot "..\scripts\Export-HtmlReport.ps1"

        Test-Path $ScriptPath | Should -BeTrue

    }

}