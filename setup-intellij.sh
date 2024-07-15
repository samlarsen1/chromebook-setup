#!/bin/bash

# Define variables
intellij_url="https://www.jetbrains.com/intellij/download/"
checksum_url="https://www.jetbrains.com/intellij/idea/download/sha256sums.txt"
os_name="linux"
arch_name="x64"  # Update for your architecture (e.g. arm64)
filename="ideaIU-latest.tar.gz"  # Adjust based on desired edition (Community, Ultimate)

# Function to download a file
download_file() {
  url="$1"
  local_file="$2"
  echo "Downloading $url to $local_file..."
  wget -qO "$local_file" "$url"
}

# Download the checksum file
download_file "$checksum_url" "checksums.txt"

# Extract the checksum for the desired package
checksum=$(grep "$filename" "checksums.txt" | awk '{print $1}')

# Download the installer
download_file "$intellij_url/$os_name/$arch_name/$filename" "$filename"

# Verify checksum
echo "Verifying checksum..."
if [[ $(sha256sum "$filename" | awk '{print $1}') == "$checksum" ]]; then
  echo "Checksum matches! Downloaded file is likely not corrupted."
else
  echo "Checksum mismatch! Downloaded file might be corrupted. Aborting."
  rm -f "$filename"  # Remove potentially corrupted file
  exit 1
fi

# Extract the installer (adjust based on archive type)
echo "Extracting installer..."
tar -xvf "$filename"

# Move the extracted directory to a desired location (optional)
# mv ideaIU स्थापित करें /opt/

echo "Download and checksum verification complete!"

