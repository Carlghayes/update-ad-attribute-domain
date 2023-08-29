# Import Active Directory module
Import-Module ActiveDirectory

# Define the group names and corresponding attributes
$groupMappings = @{
    "Group1" = @{
        Manager       = "Manager1"
        JobTitle      = "JobTitle1"
        Location      = "Location1"
        WorkPhone     = "WorkPhone1"
    }
    "Group2" = @{
        Manager       = "Manager2"
        JobTitle      = "JobTitle2"
        Location      = "Location2"
        WorkPhone     = "WorkPhone2"
    }
}

# Iterate through each group mapping
foreach ($groupName in $groupMappings.Keys) {
    $groupInfo = $groupMappings[$groupName]
    $users = Get-ADGroupMember -Identity $groupName

    foreach ($user in $users) {
        # Retrieve user object
        $userObj = Get-ADUser -Identity $user.SamAccountName -Properties *

        # Update user attributes
        $userObj.Manager = $groupInfo.Manager
        $userObj.Title = $groupInfo.JobTitle
        $userObj.Location = $groupInfo.Location
        $userObj."telephoneNumber" = $groupInfo.WorkPhone

        # Save changes
        $userObj | Set-ADUser
    }
}