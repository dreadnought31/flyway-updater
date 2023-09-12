# flyway-updater
#Flyway Updater Ver 1 by Alan O'Brien.
#PowerShell script that downloads the current version of flyway community cli and updates it on windows. It will also create a transcript of the install for you, output same below.

#First thing to do is Check the repo link to get the latest version available

https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/

#Once you have the currentversion you need update the parameter version number on line 11: 

$onlineVersion = "latest version"

i.e

$onlineVersion = "9.22.0"

#Lastly change the filepaths to suit your environment to where Flyway is installed and where you can download the zip etc...

i.e C:\ change to D:\

#Save and run the script

It should give you the below output:

Transcript started, output file is D:\flywayinstall.txt
The new path (D:\flyway) already exists in the Path environment variable.
Cleaning up old Flyway installation


    Directory: D:\temp


Mode                LastWriteTime         Length Name                          
----                -------------         ------ ----                          
d-----        9/12/2023   5:01 PM                Flyway                        
Folder Created successfully
Download and install the latest Flyway version
d-----        9/12/2023   5:01 PM                downloads                     
Flyway Folder Created successfully
Unzip the file and output to temp folder
Copy all file in D:\temp to flyway folder
Cleanup download and temp files
Confirm Flyway is updated to newest version
Flyway Community Edition 9.22.1 by Redgate

Plugin Name           | Version         | Licensed
--------------------- | --------------- | --------
SqlFluffRulesEngine   | not installed   | Licensed
Transcript stopped, output file is D:\flywayinstall.txt
