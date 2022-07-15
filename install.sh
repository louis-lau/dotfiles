#!/bin/bash

scriptPath="$( cd "$(dirname "$0")" ; pwd -P )";

if [[ "$SHELL" != "/bin/zsh" && "$SHELL" != "/usr/bin/zsh" ]]; then
  chsh -s $(which zsh)
fi

# Symlink dotfiles
ln -s $scriptPath/.zshrc ~/.zshrc
ln -s $scriptPath/.aliases ~/.aliases

echo "Open a new shell now"
