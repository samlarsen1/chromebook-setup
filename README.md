


# Config Setup

This setup script adds main dependencies to a local linux setup for development.

This repo will set up ansible and then use it to install common dev tooling for a chromebook.

The script currently can install:
- sdkman
- gcloud
- intellij
- npm
- vscode
- pip
- terraform

## Running the scripts

* Run `cp ./variables.env.sample > ./variables.env` and add your email address
* Run `./setup.sh` which triggers ansible scripts for setup
* Toggle environment variables to install different apps

## Create a gcloud project

```bash
# authenticates to gcloud, sets up a test project and sets as local default project
./setup-gcloud-project.sh
```

## Adding specific SDKs

See usage of sdkman at [sdkman.io](https://sdkman.io/usage)

```bash
# list java versions
sdk list java
# install amazon java (Corretto)
sdk install java 21.0.5-amzn
sdk install java 23.0.1-amzn
# set a specific version to use
sdk use java 21.0.5-amzn
# check current used version
sdk current java
```

## Keep things upgraded

`apt update && apt upgrade`

## Ansible configuration

If you need to change the IP address of your local machine for ansible provisioning (i use default 127.0.0.1) update the IP value in [ansible/inventory.tpl](ansible/inventory.tpl)