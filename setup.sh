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
fi
ssh-add ~/.ssh/$keyname
echo "~/.ssh/$keyname"

./setup-ansible.sh
./setup-npm.sh
