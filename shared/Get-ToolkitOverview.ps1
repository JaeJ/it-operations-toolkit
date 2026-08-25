[CmdletBinding()]
param()

$ModulesPath = Join-Path `
    $PSScriptRoot `
    "..\modules"

$Modules = Get-ChildItem `
    -Path $ModulesPath `
    -Directory

$ModuleSummary = foreach ($Module in $Modules) {

    $ModulePath = $Module.FullName

    $ScriptCount = (
        Get-ChildItem `
            -Path "$ModulePath\scripts" `
            -Filter "*.ps1" `
            -ErrorAction SilentlyContinue
    ).Count

    $TestCount = (
        Get-ChildItem `
            -Path "$ModulePath\tests" `
            -Filter "*.Tests.ps1" `
            -ErrorAction SilentlyContinue
    ).Count

    $ReadmeExists = Test-Path "$ModulePath\README.md"
    $ChangelogExists = Test-Path "$ModulePath\CHANGELOG.md"
    $DocsExists = Test-Path "$ModulePath\docs"
    $ExamplesExists = Test-Path "$ModulePath\examples"
    $ScriptsExists = Test-Path "$ModulePath\scripts"
    $TestsExists = Test-Path "$ModulePath\tests"

    $MaturityScore = 0

    if ($ReadmeExists) { $MaturityScore += 17 }
    if ($ChangelogExists) { $MaturityScore += 17 }
    if ($DocsExists) { $MaturityScore += 17 }
    if ($ExamplesExists) { $MaturityScore += 17 }
    if ($ScriptsExists) { $MaturityScore += 16 }
    if ($TestsExists) { $MaturityScore += 16 }

    $Complete = (
        $ReadmeExists -and
        $ChangelogExists -and
        $DocsExists -and
        $ExamplesExists
    )

    $Health = if (-not $Complete) {

        "Critical"

    }
    elseif ($ScriptCount -ne $TestCount) {

        "Warning"

    }
    else {

        "Healthy"

    }

    [PSCustomObject]@{
        Module        = $Module.Name
        ScriptCount   = $ScriptCount
        TestCount     = $TestCount
        Health        = $Health
        Complete      = $Complete
        MaturityScore = $MaturityScore
    }

}

$ModuleSummary