#!/bin/bash

# Check Github ssh key
eval "$(ssh-agent -s)"

# ssh key setup
if ! test -f ~/.ssh/$KEYNAME; then
  echo "~/.ssh/$KEYNAME doesn't exist, creating key"
  ssh-keygen -t ed25519 -C "$EMAIL" -f ~/.ssh/$KEYNAME
  echo "~/.ssh/$KEYNAME created ..."
  cat ~/.ssh/$KEYNAME.pub
else
  echo "~/.ssh/$KEYNAME exists"
fi
ssh-add ~/.ssh/$KEYNAME
echo "~/.ssh/$KEYNAME"
