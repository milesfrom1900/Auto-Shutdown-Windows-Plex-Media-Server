# Auto Shutdown Windows Plex Media Server
As a result of current soaring energy prices and the state of societal disapprovement towards wasted energy, this script is developed to automate the shutdown process of a  Windows based PC running Plex Media Server. The shutdown process is only activated if no users are streaming media. This is determined by analyzing web XML info of the server status. If no users are found a predefined number of times consecutively, the script initiates the shutdown process. Time between checks are user defined. The shutdown process has a time delay where the user can cancel the shutdown process by pressing "Enter" in the powershell prompt. Benefits of using this script include personal savings, respect from environmentalists and convenience from the automation.

This project is aimed towards users using Windows based machines since they typically are repurposed desktop computers or laptops. These systems are naturally less power efficient in idle compared to purpose built low power computers.

Requirements:
1.  Windows machine with Plex Media Server installed and running
2.  Internet Explorer gone through first startup settings and ready to use

Instructions
1.  Copy file to location where it can be accessed from the Windows based Plex Media Server 
2.  Change the scripts default program to run in PowerShell
3.  On line 17 change "ServerIpAddress" to either the Servers Ip address (local) or "localhost"
4.  On line 17 change "AddTokenHere" with a current Token. See more at https://support.plex.tv/articles/204059436-finding-an-authentication-token-x-plex-token/
    (This is a temporary token, so it might change. Further develop is possible if this becomes an issue)
5.  (Optional) Define parameters by changing the number, or leave as default. 
    Parameters:
      1.  startIdle         #Time (s) after bootup before program starts checking server streaming. Default: 1
      2.  checkInterval     #Time (s) between each check in seconds                                 Default: 300
      3.  checkNumber       #Number of consecuative checks needed for a shutdown                    Default: 3
      4.  ShutdownWaitTime  #Shutdown delay time (s). This gives user time to cancel the shutdown   Default: 120
6.  (Optional) Make script start at bootup by ex. adding a shortcut to script in: run -> shell:startup

  
