$csvPath = "C:\Users\KhoaHoang\Downloads\VSCode\Powershell-Project\ManagerUser\users.csv"

function Enter-Users {
    param(
        [string]$csvPath,
        [string]$domain
    )
    # Importing the CSV file
    $csvFile = Import-Csv -path $csvPath

    
    #Assign a temporary password
    $Password = "Welcome123#!"
    
    $PasswordProfile = New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile
    $PasswordProfile.Password = $Password

    
    foreach ($row in $csvFile) {
        $DisplayName = $row.GivenName + " " + $row.Surname
        $UserPrincipalName = $row.GivenName.Substring(0,1) + $row.Surname + $domain
        $UserPrincipalName = $UserPrincipalName.ToLower()
        $MailNickName = $row.GivenName.Substring(0,1) + $row.Surname
        $MailNickName = $MailNickName.ToLower()

        
        New-AzureADUser -DisplayName $DisplayName -GivenName $row.GivenName -Surname $row.Surname -PasswordProfile $PasswordProfile -UserPrincipalName $UserPrincipalName -Department $row.Department -UsageLocation "US" -AccountEnabled $true -MailNickName $MailNickName
    }
}

Enter-Users -csvPath $csvPath -domain "@awakenservices.net"
