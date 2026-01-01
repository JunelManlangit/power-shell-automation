# bulk creation of active directory user account

# this script generates 20 users in specific OU. useful for testing and lab environments.


Import-Module ActiveDirectory

for ($a = 1; $a -le 20; $a++){

$usrname = "user$a"
$psswrd = ConvertTo-SecureString "P@ssword123" -AsPlainText -Force

New-ADUser `

  -Name $usrname `
   -SamAccountName $usrname `
     -UserPrincipalName "$usrname@domain.local" `
      -Path "OU=testOU,DC=domain,DC=local" `
         -AccountPassword $psswrd `
          -Enabled $true `
}