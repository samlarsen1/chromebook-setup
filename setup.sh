#!/bin/bash

# Parse variables
source ./variables.sh

if [ "$SETUP_KEY" = true ]; then
  source ./setup-env.sh
fi

# setup profile
./setup-profile.sh

# install prerequisites
./setup-ansible.sh

# install apps
./install-apps.sh

# add symlinks
ln -sr ./gcloud-check.sh ~/bin/gcloud-check
ln -sr ./gcloud-setup-project.sh ~/bin/gcloud-setup-project
ln -sr ./gcloud-list-projects.sh ~/bin/gcloud-list-projects