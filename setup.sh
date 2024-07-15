#!/bin/bash

upgraded=false

###  Check Github ssh key

keyname="github"
email="sam.r.larsen@gmail.com"
eval "$(ssh-agent -s)"
# ssh key setup
if ! test -f ~/.ssh/$keyname; then
  echo "~/.ssh/$keyname doesn't exist, creating key"
  ssh-keygen -t ed25519 -C "$email" -f ~/.ssh/$keyname
  echo "new public key ~/.ssh/$keyname below ..."
  cat ~/.ssh/$keyname.pub
  ssh-add ~/.ssh/$keyname
else
  log_exists("ssh key ~/.ssh/${keyname}")
fi

### Check Ansible Install

if ! command -v ansible >/dev/null 2>&1; then
  echo "Ansible is not installed.  Installing now ..."
  ./setup-ansible.sh
else
  log_exists("Ansible")
fi



# If nothing installed or upgraded, run upgrade
if ! $upgraded; then
  apt update
  apt upgrade
fi

function log_exists() {
  echo "Skip: $1 already exists"
}

