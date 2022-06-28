$users = Get-Content "input_users.txt"

foreach($username in $users) {
    Write-Host $username
    Get-AzureADUser -SearchString $username | Get-AzureADUserMembership | % {Get-AzureADObjectByObjectId -ObjectId $_.ObjectId | select DisplayName,ObjectType,MailEnabled,SecurityEnabled,ObjectId} | ft 
}
