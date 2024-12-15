#!/bin/bash

# Check if Ansible is installed
if ! command -v ansible &> /dev/null; then
    echo "Ansible is not installed. Please install it before proceeding."
    exit 1
fi

# Now, call the Ansible playbooks
ansible-playbook -i hosts ./playbooks/install-basics.yml

declare -A playbooks=(
    ["INSTALL_NPM"]="install-npm.yml"
    ["INSTALL_VSCODE"]="install-vscode.yml"
    ["INSTALL_SDKMAN"]="install-sdkman.yml"
    ["INSTALL_INTELLIJ"]="install-intellij.yml"
    ["INSTALL_GCLOUD"]="install-gcloud.yml"
    ["INSTALL_TERRAFORM"]="install-terraform.yml"
    ["INSTALL_PIP"]="install-pip.yml"
    ["INSTALL_PYTHON3_10"]="install-python3.10.yml"
)

for var in "${!playbooks[@]}"; do
    if [ "${!var}" = true ]; then
        ansible-playbook -i hosts "./playbooks/${playbooks[$var]}"
    fi
done