

#Install PSScriptAnalyzer
#This is a static code checker for PS modules & Scripts.

Install-Module -Name PSScriptAnalyzer -Force


#Import AD Module
Import-Module ActiveDirectory




$users = Get-ADUser -Filter *

foreach ($user in $users) {
    # Update Manager Field
    Set-ADUser -Identity $user -Manager "CN=John Doe,OU=Managers,DC=domain,DC=com"

    # Update Department Field
    Set-ADUser -Identity $user -Title "New Department"

    # Update Job Title
    Set-ADUser -Identity $user -Title "New Job Title"
    
    # Update Location
    Set-ADUser -Identity $user -Office "New Location"
    
    # Update Work Phone Number
    Set-ADUser -Identity $user -OfficePhone "New Phone Number"
}

