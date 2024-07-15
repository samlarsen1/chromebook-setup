#!/bin/bash

# Define the cron job command
CRON_JOB="0 */6 * * * apt-get update && apt-get -y upgrade"

# Check if the cron job already exists
crontab -l | grep -Fq "$CRON_JOB"

# If the cron job doesn't exist, add it
if [ $? -eq 1 ]; then
    (crontab -l 2>/dev/null; echo "$CRON_JOB") | crontab -
    echo "Cron job added successfully."
else
    echo "Cron job already exists."
fi