#!/bin/bash

# Parse variables
source ./variables.sh

if [ "$SETUP_KEY" = true ]; then
  source ./setup-env.sh
fi

# install prerequisites
./setup-ansible.sh

# install apps
./install-apps.sh
