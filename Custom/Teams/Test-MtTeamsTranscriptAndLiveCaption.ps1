<#
.SYNOPSIS
    Ensure transcription and live captions are disabled

.DESCRIPTION
    Transcription and live captions should be disabled

.EXAMPLE
    Test-MtTeamsTranscriptAndLiveCaption

    Returns true if both transcription and live captions are disabled

.LINK
    https://maester.dev/docs/commands/
#>
function Test-MtTeamsTranscriptAndLiveCaption {
    [CmdletBinding()]
    [OutputType([bool])]
    param()
    
    if (-not (Test-MtConnection Teams)) {
        Add-MtTestResultDetail -SkippedBecause NotConnectedTeams
        return $null
    }

    $return = $true
    try {
        $TeamsMeetingPolicy = Get-CsTeamsMeetingPolicy -Identity Global | Select-Object AllowTranscription, LiveCaptionsEnabledType

        $passResult = "✅ Pass"
        $failResult = "❌ Fail"

        $result = "| Policy | Value | Status |`n"
        $result += "| --- | --- | --- |`n"

        if ($TeamsMeetingPolicy.AllowTranscription -eq $false) {
            $result += "| AllowTranscription | $($TeamsMeetingPolicy.AllowTranscription) | $passResult |`n"
        } else {
            $result += "| AllowTranscription | $($TeamsMeetingPolicy.AllowTranscription) | $failResult |`n"
            $return = $false
        }
        if ($TeamsMeetingPolicy.LiveCaptionsEnabledType -eq "Disabled") {
            $result += "| LiveCaptionsEnabledType | $($TeamsMeetingPolicy.LiveCaptionsEnabledType) | $passResult |`n"
        } else {
            $result += "| LiveCaptionsEnabledType | $($TeamsMeetingPolicy.LiveCaptionsEnabledType) | $failResult |`n"
            $return = $false
        }
        if ($return) {
            $testResultMarkdown = "Well done. Transcription and live captions are disabled.`n`n%TestResult%"
        } else {
            $testResultMarkdown = "Transcription or live captions are allowed.`n`n%TestResult%"
        }
        $testResultMarkdown = $testResultMarkdown -replace "%TestResult%", $result
        Add-MtTestResultDetail -Result $testResultMarkdown
    } catch {
        $return = $false
        Write-Error $_.Exception.Message
    }
    return $return
}