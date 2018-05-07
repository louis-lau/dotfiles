#!/bin/bash

scriptPath="$( cd "$(dirname "$0")" ; pwd -P )";

# Install zsh and other defaults
sudo apt-get update
sudo apt-get install zsh nano htop -y
chsh -s $(which zsh)

# Install oh-my-zsh, just for defaults and included plugins
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O ~/install-ohmyzsh.sh
sed -i.tmp 's:env zsh::g' install.sh
sed -i.tmp 's:chsh -s .*$::g' install.sh
sh ~/install-ohmyzsh.sh
rm ~/install-ohmyzsh.sh

# Install Zplug for additional plugins
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh

#Install BashHub for command history
bash curl -OL https://bashhub.com/setup && zsh setup

# Symlink dorfiles
ln -s $scriptPath/.zshrc ~/.zshrc
ln -s $scriptPath/.selected_editor ~/.selected_editor

# Reload shell
exec zsh
