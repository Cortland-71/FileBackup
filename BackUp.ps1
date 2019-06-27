#sets time and date var for file 
$date = Get-Date -UFormat "%m-%d-%y@%H-%M-%S"

#Backup
robocopy \\Server1\folder\file \\Server2\folder\fileBackup-$date /E

#This will clear out old backups at specified amounts

$backupCheck = Get-ChildItem '\\Server2\folder'

#this will clear out the oldest possible backup while keeping 3 weeks worth of the newest backups

if ($backupCheck.Count -gt 84)
{
    Get-ChildItem '\\Server2\folder' | Sort-Object CreationTime | Select-Object -First 1 | Remove-Item -Force -Recurse
    
}

