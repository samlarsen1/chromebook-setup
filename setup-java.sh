#!/bin/bash

sudo apt update
sudo apt install default-jdk

curl -s "https://get.sdkman.io" | bash

sdkman --version

echo "source /usr/local/sdkman/bin/sdkman-init.sh" >> ~/.bashrc

