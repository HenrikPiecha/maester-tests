Ensure default OneDrive retention is lower than 93 days due to storage costs after that.

Microsoft will charge organizations for unlicensed OneDrive account storage. Therefore, admins must manage these unlicensed OneDrive accounts before the organization ends up with unexpected costs or deleted OneDrive files.

#### Check unlicensed OneDrive accounts:

1. Sign in to [Sharepoint admin center](https://admin.microsoft.com/sharepoint).
2. Click **Reports** > **OneDrive accounts**.
3. Click **Download Report**.

Reasons for unlicensed state:\
- **Retention period:** Account is no longer licensed but is still active because a retention period setting is keeping the account from being deleted.
- **Retention policy:** Account is no longer licensed but is still active because a retention policy in Purview is keeping the account from being deleted.
- **Active user with no license:** Account is active but is not licensed. This can happen if the license is removed but the user is not removed from Microsoft Entra ID.
- **Duplicate accounts:** Account is a duplicate because a licensed user has multiple OneDrive accounts associated with them. Duplicate accounts (also known as non-primary accounts) may arise if a user has geographic move, if a user leaves and then rejoins an organization, or from other factors.


#### Remediation action:

To change the default OneDrive retention:
1. Navigate to [Sharepoint admin center](https://admin.microsoft.com/sharepoint)..
2. Click **Settings**.
3. Select **OneDrive > Retention**.
4. Change the value to **90 days or less**.
5. Click **Save**.

#### Related links

* [Microsoft 365 Admin Center](https://admin.microsoft.com)
* [Manage unlicensed OneDrive user accounts](https://learn.microsoft.com/en-us/sharepoint/unlicensed-onedrive-accounts)
* [Microsoft 365 Customers can face Hefty Costs Starting January 27, 2025 Due to Unlicensed OneDrive Accounts](https://ragnarheil.de/alert-microsoft-365-customers-can-face-hefty-costs-starting-january-27-2025-due-to-unlicensed-onedrive-accounts/)

<!--- Results --->
%TestResult%