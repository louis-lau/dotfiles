#!/bin/bash

scriptPath="$( cd "$(dirname "$0")" ; pwd -P )";

if [[ "$SHELL" != "/bin/zsh" || "$SHELL" != "/usr/bin/zsh" ]]; then
  # Install zsh and other defaults
  sudo apt-get update
  sudo apt-get install zsh nano htop python curl wget gawk -y
  chsh -s $(which zsh)
fi

# Install Zplug for additional plugins
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh

exec $(which zsh)

# Symlink dotfiles
ln -s $scriptPath/.zshrc ~/.zshrc
ln -s $scriptPath/.aliases ~/.aliases

# Reload shell
exec $(which zsh)
