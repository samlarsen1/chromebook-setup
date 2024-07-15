#!/bin/bash

if ! command -v npm &> /dev/null; then
  echo "npm is not installed. Installing npm..."
  # Add your installation command here
  sudo apt-get install curl -y
  curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -
  sudo apt-get install -y nodejs

fi

node -v
npm -v