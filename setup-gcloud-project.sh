#!/bin/bash

# Check if gcloud is installed
if ! command -v gcloud &> /dev/null; then
    echo "gcloud is not installed. Check installation in readme."
    exit 1
fi

# Authenticate with gcloud
echo "gcloud is installed. Proceeding with authentication..."
gcloud auth login

# Generate a random number for the project suffix
RANDOM_SUFFIX=$RANDOM

# Define the project ID with prefix and random suffix
PROJECT_ID="test-project-$RANDOM_SUFFIX"

# Create the project
echo "Creating project with ID: $PROJECT_ID"
gcloud projects create "$PROJECT_ID"

echo "Project $PROJECT_ID created successfully."

# Set the created project as the default project
echo "Setting $PROJECT_ID as the default project..."
gcloud config set project "$PROJECT_ID"


echo "Default project set to $PROJECT_ID."