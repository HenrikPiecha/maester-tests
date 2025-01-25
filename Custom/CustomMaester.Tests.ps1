BeforeAll {
    Get-ChildItem -Path $PSScriptRoot -Recurse -Filter 'Test-*.ps1' | ForEach-Object { 
        . $_.FullName 
    }
}

Describe "Roles and permissions" -Tag "All", "Custom", "Entra" {
    It "Ensure no graph application has permissions with a risk of having a direct or indirect path to Global Admin and full tenant takeover." -Tag "EID.CUS.001" {
        $result = Test-MtHighRiskAppPermissions
        $result | Should -Be $true -Because "no graph application has permissions with a risk of having a direct or indirect path to Global Admin and full tenant takeover."
    }
}
Describe "Teams" -Tag "All", "Custom", "Teams"  {
    It "Ensure third-party file sharing cloud services in Teams are disabled" -Tag "TEAMS.CUS.001" {
        $result = Test-MtThirdPartyFileSharing
        $result | Should -Be $true -Because "file sharing with third-party cloud services is disabled."
    }

    It "Ensure all or a majority of third-party and custom apps are blocked" -Tag "TEAMS.CUS.002" {
        $result = Test-MtThirdPartyAndCustomApps
        $result | Should -Be $true -Because "all or a majority of third-party and custom apps are blocked."
    }
  
    It "Ensure transcription and live captions are disabled" -Tag "TEAMS.CUS.003" {
        $result = Test-MtTeamsTranscriptAndLiveCaption
        $result | Should -Be $true -Because "transcription and live captions are disabled."
    }
    
    It "Ensure presence status is hidden from external contacts" -Tag "TEAMS.CUS.004" {
        $result = Test-MtTeamsPrivacyMode
        $result | Should -Be $true -Because "privacy mode is enabled in Teams."
    }    
}

Describe "SharePoint" -Tag "All", "Custom", "SharePoint" {
    It "Ensure default OneDrive retention is lower than 93 days." -Tag "SPO.CUS.001", "OneDrive" {
        $result = Test-MtOneDriveRetention
        $result | Should -Be $true -Because "default OneDrive retention is lower than 93 days."
    }
}