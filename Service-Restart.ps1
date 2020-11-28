# Author: Armaan Hussain
# Date: 27/11/2020
# Description: Restarts the Spooler service.


$date = (Get-Date -Format "ddMMyyyy")
$time = (Get-Date -Format "HHmm")
$time.ToUniversalTime()
$logFile = "L:\Armaan\ScriptLocation\Service_Restart$date.txt"

Clear-Host

$srvName = "Spooler"
$service = Get-Service -Name $srvName

if ($service.status -eq "Stopped") {
echo "$srvName is already stopped. Exiting…" >> $logFile
Exit
} 

else{ ($service.status -eq "Running")
"Current status: $srvName is now " + $service.status >> $logFile
Stop-Service $srvName
$serviceAfter = Get-Service -Name $srvName
"$srvName is now " + $serviceAfter.status >> $logFile
Start-Sleep -s 5
echo "Waiting..." >> $logFile
Start-Service $srvName
$serviceAfterStart = Get-Service -Name $srvName
"$srvName is now " + $serviceAfterStart.status >> $logFile
echo "Service: Spooler has been restarted at $time UTC." >> $logFile
}