BeforeAll {
    Get-ChildItem -Path $PSScriptRoot -Recurse -Filter 'Test-*.ps1' | ForEach-Object { 
        . $_.FullName 
    }
}
Describe "bIT.AdminCenter" -Tag "bIT", "All", "Custom", "M365AC", "OrgSettings"  {
    It "bIT: Ensure idle session timeout is configured for Microsoft 365 admin center" -Tag "bIT.1001" {
        $result = Test-MtIdleSessionTimoutsM365AC
        $result | Should -Be $true -Because "Idle session timeout for Microsoft 365 admin center is configured."
    }

    It "bIT: Ensure 'External sharing' of calendars is not available" -Tag "bIT.1002" {
        $result = Test-MtExternalCalendarSharing
        $result | Should -Be $true -Because "'External sharing' of calendars is Disabled."
    }
    
    It "bIT: Ensure self-service trials and purchases are disabled" -Tag "bIT.1003" {
        $result = Test-MtSelfServiceTrials
        $result | Should -Be $true -Because "all self-service trials and purchases are disabled."
    }

    It "bIT: Ensure the microsoft domain '.onmicrosoft.com' is set as default domain" -Tag "bIT.1015" {
        $result = Test-MtCustomDomains
        $result | Should -Be $true -Because "default domain is '.onmicrosoft.com' domain."
    }

    It "bIT: Ensure email notifications are configured to use your domain" -Tag "bIT.1017" {
        $result = Test-MtEmailNotificationsDomain
        $result | Should -Be $true -Because "email notifications are sent from an internal domain."
    }
}

Describe "bIT.RolesAndPermissions" -Tag "bIT", "All", "Custom", "Entra" {
    It "bIT: Ensure Azure DevOps Administrator has at least one member" -Tag "bIT.1004", "DevOps" {
        $result = Test-MtAzureDevOpsAdminCount
        $result | Should -Be $true -Because "Azure DevOps Administrator has at least one member."
    }

    It "bIT: Ensure no graph application has permissions with a risk of having a direct or indirect path to Global Admin and full tenant takeover." -Tag "bIT.1016", "App" {
        $result = Test-MtHighRiskAppPermissions
        $result | Should -Be $true -Because "no graph application has permissions with a risk of having a direct or indirect path to Global Admin and full tenant takeover."
    }
}

Describe "bIT.Purview" -Tag "bIT", "All", "Custom", "Purview"  {
    It "bIT: Ensure Microsoft 365 audit log search is Enabled" -Tag "bIT.1005" {
        $result = Test-MtAuditLogSearch
        $result | Should -Be $true -Because "Microsoft 365 audit log search is Enabled."
    }
}

Describe "bIT.Teams" -Tag "bIT", "All", "Custom", "Teams"  {
    It "bIT: Ensure only people in my org can bypass the lobby" -Tag "bIT.1006" {
        $result = Test-MtTeamsLobbyBypass
        $result | Should -Be $true -Because "Global (Org-wide default) meeting policy is configured to only bypass the lobby for 'Peoply in my org'."
    }

    It "bIT: Ensure communication with Skype users is disabled" -Tag "bIT.1007" {
        $result = Test-MtCommunicateWithSkypeUsers
        $result | Should -Be $true -Because "Communication with Skype users is disabled."
    }

    It "bIT: Ensure communication with unmanaged Teams users is disabled" -Tag "bIT.1008" {
        $result = Test-MtCommunicateWithUnmanagedTeamsUsers
        $result | Should -Be $true -Because "Communication with unmanaged Teams users is disabled."
    }

    It "bIT: Ensure third-party file sharing cloud services in Teams are disabled" -Tag "bIT.1009" {
        $result = Test-MtThirdPartyFileSharing
        $result | Should -Be $true -Because "file sharing with third-party cloud services is disabled."
    }

    It "bIT: Ensure all or a majority of third-party and custom apps are blocked" -Tag "bIT.1010" {
        $result = Test-MtThirdPartyAndCustomApps
        $result | Should -Be $true -Because "all or a majority of third-party and custom apps are blocked."
    }

    It "bIT: Ensure users can report security concerns in Teams to internal destination" -Tag "bIT.1020" {
        $result = Test-MtTeamsReportSecurityConcerns
        $result | Should -Be $true -Because "report security concerns in Teams is only to internal destination."
    }
    
    It "bIT: Ensure transcription and live captions are disabled" -Tag "bIT.1022" {
        $result = Test-MtTeamsTranscriptAndLiveCaption
        $result | Should -Be $true -Because "transcription and live captions are disabled."
    }
    
    It "bIT: Ensure presence status is hidden from external contacts" -Tag "bIT.1023" {
        $result = Test-MtTeamsPrivacyMode
        $result | Should -Be $true -Because "privacy mode is enabled in Teams."
    }    
}

Describe "bIT.Devices" -Tag "bIT", "All", "Custom", "Devices", "Entra", "Intune" {
    It "bIT: Ensure Mobile Threat Defense Connecors are enabled for MDE" -Tag "bIT.1011" {
        $result = Test-MtMobileThreatDefenseConnectors
        $result | Should -Be $true -Because "Microsoft Intune is connected to Microsoft Defender for Endpoint."
    }
    
    It "bIT: Ensure device clean-up rule is configured" -Tag "bIT.1012" {
        $result = Test-MtManagedDeviceCleanupSettings
        $result | Should -Be $true -Because "automatic device clean-up rule is configured."
    }

    It "bIT: Ensure tenant-wide device registration quota is configured to a maximum of 20 devices per user" -Tag "bIT.1013" {
        $result = Test-MtDeviceRegistrationPolicyQuota
        $result | Should -Be $true -Because "tenant-wide device registration quota is 20 or less."
    }

    It "bIT: Ensure tenant-wide device registration policy is configured that no one has local admin permission on registration" -Tag "bIT.1014" {
        $result = Test-MtDeviceRegistrationPolicyLocalAdmin
        $result | Should -Be $true -Because "tenant-wide device registration policy does not assign any local admin on registration."
    }
}

Describe "bIT.Entra" -Tag "bIT", "All", "Custom", "Entra" {
    It "bIT: Ensure there are no inactive Guest users in your tenant" -Tag "bIT.1018", "Guests", "Users" {
        $result = Test-MtInactiveGuests
        $result | Should -Be $true -Because "no inactive guest users found."
    }
    
    It "bIT: Ensure sign-in to shared mailboxes is blocked" -Tag "bIT.1021" {
        $result = Test-MtSharedMbxSignInBlocked
        $result | Should -Be $true -Because "sign-in to shared mailboxes is blocked."
    }

    It "bIT: Ensure group lifecycle is in place" -Tag "bIT.1024", "Groups" {
        $result = Test-MtGroupLifecycle
        $result | Should -Be $true -Because "group lifecycle is configured."
    }

    It "bIT: Ensure creation of Microsoft 365 groups and Teams is restricted" -Tag "bIT.1025", "Groups" {
        $result = Test-MtGroupCreation
        $result | Should -Be $true -Because "creation of Microsoft 365 groups and Teams is restricted."
    }
}

Describe "bIT.SharePoint" -Tag "bIT", "All", "Custom", "SharePoint" {
    It "bIT: Ensure default OneDrive retention is lower than 93 days." -Tag "bIT.1019" {
        $result = Test-MtOneDriveRetention
        $result | Should -Be $true -Because "default OneDrive retention is lower than 93 days."
    }
}