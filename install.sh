#!/bin/bash

set -e

sudo add-apt-repository -y ppa:neovim-ppa/stable
# sudo apt-get update

sudo apt install -y neovim
sudo apt install -y git
sudo apt install -y python3
sudo apt install -y python

if ! [ -x "$(command -v n)" ]; then
  curl -L https://git.io/n-install | bash -s -- -y
  set -i
  . ~/.bashrc
  set +i
fi

npm install -g gulp-cli

