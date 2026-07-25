Describe "Export-ToolkitDashboard Script" {

    It "Script Exists" {

        $ScriptPath = Join-Path `
            $PSScriptRoot `
            "..\shared\Export-ToolkitDashboard.ps1"

        Test-Path $ScriptPath | Should -BeTrue

    }

}