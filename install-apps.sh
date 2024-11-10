#!/bin/bash

# Check if Ansible is installed
if ! command -v ansible &> /dev/null; then
    echo "Ansible is not installed. Please install it before proceeding."
    exit 1
fi

# Now, call the Ansible playbook
ansible-playbook -i hosts install-vscode.yml
