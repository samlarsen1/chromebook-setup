#!/bin/bash

# Check if Ansible is installed
if ! command -v ansible &> /dev/null; then
    echo "Ansible is not installed. Please install it before proceeding."
    exit 1
fi

# Now, call the Ansible playbooks
ansible-playbook -i hosts ./playbooks/install-basics.yml

# Define the playbooks associative array without commas
declare -A playbooks=(
    ["install-npm.yml"]="${INSTALL_NPM}"
    ["install-vscode.yml"]="${INSTALL_VSCODE}"
    ["install-sdkman.yml"]="${INSTALL_SDKMAN}"
    ["install-intellij.yml"]="${INSTALL_INTELLIJ}"
    ["install-pip.yml"]="${INSTALL_PIP}"
    ["install-python3.10.yml"]="${INSTALL_PYTHON3_10}"
    ["install-python3.11.yml"]="${INSTALL_PYTHON3_11}"
    ["install-gcloud.yml"]="${INSTALL_GCLOUD}"
    ["install-terraform.yml"]="${INSTALL_TERRAFORM}"
)

# Iterate over the playbooks array
for var in "${!playbooks[@]}"; do
    if [ "${playbooks[$var]}" = "true" ]; then
        ansible-playbook -i hosts "./playbooks/${var}"
    fi
done