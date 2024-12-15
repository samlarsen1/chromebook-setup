#!/bin/bash

# Check if Ansible is installed
if ! command -v ansible &> /dev/null; then
    echo "Ansible is not installed. Please install it before proceeding."
    exit 1
fi

# Now, call the Ansible playbooks
ansible-playbook -i hosts ./playbooks/install-basics.yml

[ "$INSTALL_NPM"      = true ] && ansible-playbook -i hosts ./playbooks/install-npm.yml
[ "$INSTALL_VSCODE"   = true ] && ansible-playbook -i hosts ./playbooks/install-vscode.yml
[ "$INSTALL_JAVA"     = true ] && ansible-playbook -i hosts ./playbooks/install-java.yml 
[ "$INSTALL_INTELLIJ" = true ] && ansible-playbook -i hosts ./playbooks/install-intellij.yml
[ "$INSTALL_GCLOUD"   = true ] && ansible-playbook -i hosts ./playbooks/install-gcloud.yml