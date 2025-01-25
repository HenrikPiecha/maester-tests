Ensure your presence status is hidden outside your organization.

While Presence Status is beneficial within your organization, there are valid reasons to hide it when communicating with external contacts.

- **Privacy Concerns:** Individual users may have privacy concerns about sharing their Presence Status with people outside their organization. Hiding the status can help protect their personal information.
- **Security Implications:** Organizations may want to limit the information external contacts can access for security reasons. By hiding their Presence Status, they can control what external parties see.
- **Maintaining a Professional Image:** Hiding Presence Status can help maintain a professional image when interacting with clients, partners, or customers. It ensures that external contacts perceive your organization as being proactive and responsive.

Please note:\
External users with personal Microsoft Teams accounts (with email addresses like @hotmail.com or @outlook.com) can still see your Presence Status, even if you enable Privacy mode within Microsoft Teams.

#### Remediation action:

To hide presence status outside the organization using PowerShell:
1. Connect to Teams using **Connect-MicrosoftTeams**.
2. Run following PowerShell Command:
```
Set-CsPrivacyConfiguration -EnablePrivacyMode $true
```

#### Related links

* [Microsoft 365 Admin Center](https://admin.microsoft.com)
* [Microsoft Teams Admin Center](https://admin.teams.microsoft.com).
* [User presence in Teams](https://learn.microsoft.com/en-us/microsoftteams/presence-admins#presence-states-in-teams)
* [PowerShell - Set-CsPrivacyConfiguration](https://learn.microsoft.com/en-us/powershell/module/skype/set-csprivacyconfiguration?view=skype-ps)

<!--- Results --->
%TestResult%