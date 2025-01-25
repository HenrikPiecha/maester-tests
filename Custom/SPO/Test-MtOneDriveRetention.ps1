<#
.SYNOPSIS
    Ensure default OneDrive retention is lower than 93 days due to storage costs after that.

.DESCRIPTION
    OneDrive retention should be lower than 93 days otherwise the storage cost of unlicensed accounts will be charged to the billing information specified in M365

.EXAMPLE
    Test-MtOneDriveRetention

    Returns true if OneDrive retention is lower than 93 days

.LINK
    https://maester.dev/docs/commands/
#>
function Test-MtOneDriveRetention {
    [CmdletBinding()]
    [OutputType([bool])]
    param()
    
    if (-not (Test-MtConnection Graph)) {
        Add-MtTestResultDetail -SkippedBecause NotConnectedGraph
        return $null
    } 
    $return = $true
    try {
        $policy = Invoke-MtGraphRequest -RelativeUri "admin/sharepoint/settings" -ApiVersion "v1.0"
        if ($policy.deletedUserPersonalSiteRetentionPeriodInDays -lt 93) {
            Add-MtTestResultDetail -Result "Well done. Your OneDrive retention for deleted users is $($policy.deletedUserPersonalSiteRetentionPeriodInDays) days."
        } else {
            Add-MtTestResultDetail -Result "Your OneDrive retention for deleted users is greater than 93 days, value: $($policy.deletedUserPersonalSiteRetentionPeriodInDays) days."
            $return = $false
        }
    } catch {
        $return = $false
        Write-Error $_.Exception.Message
    }
    return $return
}