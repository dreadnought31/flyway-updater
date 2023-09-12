# flyway-updater
#Flyway Updater Ver 1 by Alan O'Brien.
#PowerShell script that downloads the current version of flyway community cli and updates it on windows 

# First thing to do is Check the repo link to get the latest version available

https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/

#Once you have the currentversion you need update the parameter version number on line 11: 

$onlineVersion = "latest version"

i.e

$onlineVersion = "9.22.0"

#Lastly change the filepaths to suit your environment to where Flyway is installed and where you can download the zip etc...

i.e C:\ change to D:\

#Save and run the script
