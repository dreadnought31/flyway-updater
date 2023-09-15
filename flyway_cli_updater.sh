#!/bin/bash
#FlywayCommunity Updater Ver 1 by Alan O'Brien
# Define the Flyway download URL
FLYWAY_DOWNLOAD_URL="https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline"
current_version="9.22.1"
new_version="9.22.1"

#Delete current Flyway directory
sudo rm -r "/opt/flyway/$current_version"
echo "Delete current Flyway directory"

# Define the installation directory
install_dir="/opt/flyway/$new_version"
echo "Define the installation directory"


# Create the installation directory if it doesn't exist
sudo mkdir -p "$install_dir"
echo "Create the installation directory if it doesn't exist"

# Download and extract the Flyway archive
download_link="$FLYWAY_DOWNLOAD_URL/$online_version/flyway-commandline-$online_version-linux-x64.tar.gz"
wget -qO- "$download_link" | sudo tar -xz -C "$install_dir" --strip-components=1
echo "Flyway $new_version has been downloaded and installed to $install_dir."

#Delete Old Symbolic Link if there
echo "Delete Old Symbolic Link if there"
sudo unlink /usr/local/bin/flyway

# Create symbolic link for easy access
sudo ln -s "$install_dir/flyway" /usr/local/bin/flyway
echo "Symbolic link to flyway created in /usr/local/bin."

# Confirm new installed version
echo "Confirm new installed version"
flyway --version
