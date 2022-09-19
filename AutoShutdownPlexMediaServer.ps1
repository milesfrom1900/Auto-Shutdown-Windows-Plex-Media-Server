

Write-Host (Get-Date) "Plex Automatic Shutdown"
Write-Host (Get-Date) "By milesfrom1900"
Write-Host (Get-Date) "https://github.com/milesfrom1900/AutoShutdownPlexMediaServer"
Write-Host (Get-Date) "2022"

$startIdle = 1          #Time after bootup before program starts checking server streaming in seconds
$checkInterval = 300    #Time between each check in seconds
$checkNumber = 3        #Number of consecuative checks needed for a shutdown
$ShutdownWaitTime = 120 #Wait time before shutdown (time allowes for user to cancel the shutdown)

Write-Host (Get-Date) "Start Idle:" $startIdle "s, Check Interval:" $checkInterval "s, Number of checks:" $checkNumber "Shutdown Timer:" $ShutdownWaitTime "s"



$URL = "http://<ServerIpAddress>:32400/status/sessions?X-Plex-Token=<AddTokenHere>"
start-sleep $startIdle
while (1) {
    for ($noStreamCount = 1; $noStreamCount -le $checkNumber;$noStreamCount++) {
        start-sleep $checkInterval
        Write-Host (Get-Date) "Checking for current Plex stream..."
        $data = Invoke-WebRequest -Uri $URL
        If ($data -match '<MediaContainer size="0">') 
            {
            Write-Host (Get-Date) "Plex stream not detected:" $noStreamCount -BackgroundColor Red
            $isNotStreaming = $true
            }
        Else {     
            $isNotStreaming = $false
            break
        }
    }
    If ($isNotStreaming) { 
        Write-Host (Get-Date) "HTPC will shutdown shortly..." -BackgroundColor Red
        c:\windows\system32\shutdown.exe /s /t $ShutdownWaitTime /c "HTPC will shutdown shortly"
        function pause{ $null = Read-Host (Get-Date) 'Press enter to cancel shutdown process...'} 
        pause
        c:\windows\system32\shutdown.exe /a 
        Write-Host (Get-Date) "Shutdown process terminated" -BackgroundColor Green
        }
    Else {
        Write-Host (Get-Date) "Plex stream detected"
        }
    }