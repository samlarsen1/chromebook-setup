#!/bin/bash

# Load environment variables from .env file
if [ -f ./variables.env ]; then
  export $(cat ./variables.env | xargs)
else
  echo ".env file not found!"
  exit 1
fi

echo "*** Environment Variables ***"
echo "Variable: SETUP_KEY=$SETUP_KEY"
echo "Variable: KEYNAME=$KEYNAME"
echo "Variable: EMAIL=$EMAIL"
# Loop over all environment variables
for var in $(env); do
  # Check if the variable name starts with "INSTALL_"
  if [[ $var == INSTALL_* ]]; then
    # Extract the variable name and value
    var_name=$(echo "$var" | cut -d'=' -f1)
    var_value=$(echo "$var" | cut -d'=' -f2-)
    # Echo the variable name and value
    echo "Variable: $var_name=$var_value"
  fi
done
echo " "
