# Script to download and install Flyway CommandLine CLI on Windows
# Check the repo link to get the latest version (https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/) and update the version number on line 5: $onlineVersion = "latest version"
# Flyway Updater Ver 1.2 by Alan O'Brien
# Ver 1.0 - AOB Created 11-09-2023
# Ver 1.1 - AOB 12-09-2023 Added new script section: add the installation folder to "Path" in System Environment Variables if not already there.
# Ver 1.2 - AOB 12-09-2023 Added Enforcement of TLS 1.2 and updated download folder path.

Start-Transcript -Path "D:\flywayinstall.txt" -append
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
# Parameters
$onlineVersion = "9.22.1"
$URL = “https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/$onlineVersion/flyway-commandline-$onlineVersion.zip”
$Path= ”D:\temp\downloads\flyway-commandline-$onlineVersion.zip”
$destination = "D:\temp\Flyway"
$flywayInstallPath = "D:\Flyway"
$FolderName = "D:\temp\Flyway\"
$Downloads =  "D:\temp\downloads"

# Add the location of the flyway folder to System Environment Variable if it is needed, if already there it will skip this.
$newPath = "D:\flyway"

# Get the current value of the Path variable
$currentPath = [System.Environment]::GetEnvironmentVariable("Path", [System.EnvironmentVariableTarget]::Machine)

# Check if the new path already exists in the Path variable
if ($currentPath -notlike "*$newPath*") {
    # Append the new path to the existing value, separated by a semicolon
    $updatedPath = "$currentPath;$newPath"

    # Set the updated Path variable
    [System.Environment]::SetEnvironmentVariable("Path", $updatedPath, [System.EnvironmentVariableTarget]::Machine)

    Write-Host "The new path ($newPath) has been added to the Path environment variable." -ForegroundColor Green
} else {
    Write-Host "The new path ($newPath) already exists in the Path environment variable." -ForegroundColor Green
}

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

#Download and install the latest Flyway version
Write-Host "Download and install the latest Flyway version" -ForegroundColor Green
# PowerShell Create downloads directory if not exists
# Check if folder exist and create if needed, then Download the latest Flyway version
if (Test-Path $Downloads) {
   
    Write-Host "Flyway Folder Exists" -ForegroundColor Green
    # Perform Delete file from folder operation
}
else
{
  
    New-Item $Downloads -ItemType Directory
    Write-Host "Flyway Folder Created successfully" -ForegroundColor Green
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
cmd.exe /c D:\flyway\flyway --version
Stop-Transcript
