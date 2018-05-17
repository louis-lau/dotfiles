#!/bin/bash

scriptPath="$( cd "$(dirname "$0")" ; pwd -P )";

if [[ "$SHELL" = "/bin/zsh" || "$SHELL" = "/usr/bin/zsh" ]]; then
  # Install oh-my-zsh, just for defaults and included plugins
  env git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

  # Install Zplug for additional plugins
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh

  # Symlink dorfiles
  ln -s $scriptPath/.zshrc ~/.zshrc

  # Reload shell
  exec $(which zsh)
else
  # Install zsh and other defaults
  sudo apt-get update
  sudo apt-get install zsh nano htop python curl wget gawk -y
  chsh -s $(which zsh)
  echo "Now logout and login again, or reboot."
  echo "Then run this script again"
fi
