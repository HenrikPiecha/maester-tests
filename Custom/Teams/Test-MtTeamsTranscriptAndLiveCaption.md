Ensure transcription and live captions are disabled

Due to the non-guaranteed processing of transcription and live captions within the EU data protection boundaries, these services should be deactivated as long as there are no special operating agreements in place.

#### Remediation action:

To disable transcription and live captions using the UI:
1. Navigate to **Microsoft Teams admin center** [https://admin.teams.microsoft.com](https://admin.teams.microsoft.com).
2. Click to expand **Meetings** select **Meeting policies**.
3. Click **Global (Org-wide default)**.
4. Scroll down to **Recording & transcription**.
5. Set **Transcription** to **Off**.
6. Set **Live captions** to **Off**.
7. Click **Save**.

To disable transcription using PowerShell:
1. Connect to Teams using **Connect-MicrosoftTeams**.
2. Run following PowerShell Command:
```
Set-CsTeamsMeetingPolicy -Identity Global -AllowTranscription $False
```

To disable live captions using PowerShell:
1. Connect to Teams using **Connect-MicrosoftTeams**.
2. Run following PowerShell Command:
```
Set-CsTeamsMeetingPolicy -Identity Global -LiveCaptionsEnabledType Disabled
```

#### Related links

* [Microsoft 365 Admin Center](https://admin.microsoft.com)
* [Microsoft Teams Admin Center](https://admin.teams.microsoft.com).
* [Overview of lobby settings and policies](https://learn.microsoft.com/en-us/microsoftteams/meeting-transcription-captions)

<!--- Results --->
%TestResult%