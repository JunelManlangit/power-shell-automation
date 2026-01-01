#get service status from another remote pc using powershell

#uses invoke command with credentials to run get-service on remote pc

$cred = get-credential
invoke-command -computername client1 -scriptblock {get-service} -credential $cred