


# Config Setup

This setup script adds main dependencies to a local linux setup for development.

This repo will set up ansible and then use it to install common dev tooling for a chromebook such as java, node, npm, intellij & vscode.

## Running the scripts

* Run `cp ./variables.env.sample > ./variables.env` and add your email address
* Run `./setup.sh` which triggers ansible scripts for setup
* Toggle environment variables to install different apps


## Ansible configuration

If you need to change the IP address of your local machine for ansible provisioning (i use default 127.0.0.1) update the IP value in [ansible/inventory.tpl](ansible/inventory.tpl)