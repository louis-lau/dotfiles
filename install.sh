#!/bin/bash

scriptPath="$( cd "$(dirname "$0")" ; pwd -P )";

sudo apt-get update
sudo apt-get install zsh nano htop -y
chsh -s $(which zsh)

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh

bash curl -OL https://bashhub.com/setup && zsh setup

ln -s $scriptPath/.zshrc ~/.zshrc
ln -s $scriptPath/.selected_editor ~/.selected_editor
