# Script to download and install Flyway CommandLine CLI on Windows
# Check the repo link to get the latest version (https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/) and update the version number on line 5: $onlineVersion = "latest version"
# Flyway Updater Ver 1 by Alan O'Brien.
Start-Transcript -Path "D:\flywayinstall.txt" -append
# Get the latest Flyway version from the website
$onlineVersion = "9.22.0"
$URL = “https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/$onlineVersion/flyway-commandline-$onlineVersion.zip”
$Path= ”D:\temp\flywaydownloads\flyway-commandline-$onlineVersion.zip”
$destination = "D:\temp\Flyway"
$flywayInstallPath = "D:\Flyway"
$FolderName = "D:\temp\Flyway\"
$Downloads =  "D:\temp\flywaydownloads"
# Clean up the old Flyway installation
Write-Host "Cleaning up old Flyway installation" -ForegroundColor Green
Remove-Item –path D:\flyway\* –recurse
# Check if folder exist and create if needed, then Download the latest Flyway version
if (Test-Path $FolderName) {
   
    Write-Host "Folder Exists" -ForegroundColor Green
    # Perform Delete file from folder operation
}
else
{
  
    #PowerShell Create directory if not exists
    New-Item $FolderName -ItemType Directory
    Write-Host "Folder Created successfully" -ForegroundColor Green
}
Write-Host "Download and install the latest Flyway version" -ForegroundColor Green
# PowerShell Create downloads directory if not exists
# Check if folder exist and create if needed, then Download the latest Flyway version
if (Test-Path $Downloads) {
   
    Write-Host "Downloads Folder Exists" -ForegroundColor Green
    # Perform Delete file from folder operation
}
else
{
  
    New-Item $Downloads -ItemType Directory
    Write-Host "Downloads Folder Created successfully" -ForegroundColor Green
}
Invoke-WebRequest -URI $URL -OutFile "$Downloads\flyway-commandline-$onlineVersion.zip"
Write-Host "Unzip the file and output to temp folder" -ForegroundColor Green
Expand-Archive -Path "$Path" -DestinationPath "D:\temp\" -Force
# Copy all file in D:\temp to flyway folder
Write-Host "Copy all file in D:\temp to flyway folder" -ForegroundColor Green
Copy-Item -Path "D:\temp\flyway*\*" -Destination D:\flyway -Recurse
# Cleanup download and temp files
Write-Host "Cleanup download and temp files" -ForegroundColor Green
Remove-Item –path "D:\temp\*" –recurse
# Confirm new version is installed
Write-Host "Confirm Flyway is updated to newest version" -ForegroundColor Green
cmd.exe /c flyway --version
Stop-Transcript