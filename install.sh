#!/bin/bash

scriptPath="$( cd "$(dirname "$0")" ; pwd -P )";

if [[ "$SHELL" != "/bin/zsh" && "$SHELL" != "/usr/bin/zsh" ]]; then
  chsh -s $(which zsh)
fi

# Install Zplug for additional plugins
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh

# Symlink dotfiles
ln -s $scriptPath/.zshrc ~/.zshrc
ln -s $scriptPath/.aliases ~/.aliases

echo "Open a new shell now"
