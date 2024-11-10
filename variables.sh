#!/bin/bash

# Load environment variables from .env file
if [ -f ./variables.env ]; then
  export $(cat ./variables.env | xargs)
else
  echo ".env file not found!"
  exit 1
fi

# Parse named arguments to override config values
while [ $# -gt 0 ]; do
  case "$1" in
    --keyname=*)
      KEYNAME="${1#*=}"
      ;;
    --email=*)
      EMAIL="${1#*=}"
      ;;
    --vscode=*)
      INSTALL_VSCODE="${1#*=}"
      ;;
    --intellij=*)
      INSTALL_INTELLIJ="${1#*=}"
      ;;
    --npm=*)
      INSTALL_NPM="${1#*=}"
      ;;
    *)
      echo "Invalid argument: $1"
      exit 1
  esac
  shift
done

echo "*** Environment Variables ***"
echo "Using keyname: $KEYNAME"
echo "Using email: $EMAIL"
# Loop over all environment variables
for var in $(env); do
  # Check if the variable name starts with "INSTALL_"
  if [[ $var == INSTALL_* ]]; then
    # Extract the variable name and value
    var_name=$(echo "$var" | cut -d'=' -f1)
    var_value=$(echo "$var" | cut -d'=' -f2-)
    # Echo the variable name and value
    echo "Variable Name: $var_name, Value: $var_value"
  fi
done
echo "*****************************"
