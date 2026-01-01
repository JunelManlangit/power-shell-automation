#creates mutliple active directory users based on csv file.

#reads user information on csv file then automatically creates AD accounts based on given
info on csv file


import-module activedirectory

$usrs = import-csv ".\users.csv"

foreach ($a in $usrs) {

try {

    New-ADUser `
        -Name $a.name `
        -SamAccountName $a.samaccountname `
        -UserPrincipalName "$($a.SamAccountName)@domain.local" `
        -Path $a.OU `
        -AccountPassword (ConvertTo-SecureString $a.psswrd -asplaintext -force) `
        -Enabled $true 
    
    write-host "created user: $($a.SamAccountName)" -foregroundcolor green
}

catch {
write-host "ERROR creating $($a.SamAccountName): $_" -foregroundcolor red 
}

}