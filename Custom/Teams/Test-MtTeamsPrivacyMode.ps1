<#
.SYNOPSIS
    Ensure presence status is hidden from external contacts

.DESCRIPTION
    Presence status should be hidden from external contacts

.EXAMPLE
    Test-MtTeamsPrivacyMode

    Returns true if only presence status is hidden from external contacts

.LINK
    https://maester.dev/docs/commands/
#>
function Test-MtTeamsPrivacyMode {
    [CmdletBinding()]
    [OutputType([bool])]
    param()
    
    if (-not (Test-MtConnection Teams)) {
        Add-MtTestResultDetail -SkippedBecause NotConnectedTeams
        return $null
    }

    $return = $true
    try {
        $TeamsPrivacyMode = Get-CsPrivacyConfiguration | Select-Object -ExpandProperty EnablePrivacyMode
        if ($TeamsPrivacyMode -eq $true) {
            Add-MtTestResultDetail -Result "Well done. Your presence status is hidden from external contacts."
        } else {
            Add-MtTestResultDetail -Result "External contacts can view your presence status."
            $return = $false
        }
    } catch {
        $return = $false
        Write-Error $_.Exception.Message
    }
    return $return
}