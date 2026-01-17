#!/bin/bash

# Check gcloud installation and authentication
./gcloud-check.sh
if [ $? -eq 1 ]; then
    exit 1
fi

# Set prefix from argument or default
PREFIX="${1:-test-project}"

# Generate a random number for the project suffix
RANDOM_SUFFIX=$RANDOM

# Define the project ID with prefix and random suffix
PROJECT_ID="${PREFIX}-$RANDOM_SUFFIX"

# Create the project
echo "Creating project with ID: $PROJECT_ID"
gcloud projects create "$PROJECT_ID"

echo "Project $PROJECT_ID created successfully."

# Set the created project as the default project
echo "Setting $PROJECT_ID as the default project..."
gcloud config set project "$PROJECT_ID"


echo "Default project set to $PROJECT_ID."