#!/bin/bash

# Check if gcloud is installed
if ! command -v gcloud &> /dev/null; then
    echo "gcloud is not installed. Check installation in readme."
    exit 1
fi

# Authenticate with gcloud
ACCOUNT=$(gcloud auth list --filter=status:ACTIVE --format="value(account)" 2>/dev/null)
if [[ -z "$ACCOUNT" ]]; then
    echo "Not authenticated. Proceeding with authentication..."
    gcloud auth login
else
    echo "Already gcloud authenticated as $ACCOUNT."
fi