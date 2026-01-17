#!/bin/bash

# Check gcloud installation and authentication
./gcloud-check.sh
if [ $? -eq 1 ]; then
    exit 1
fi

# List projects
gcloud projects list
echo "Default project set to: $(gcloud config get-value project)"