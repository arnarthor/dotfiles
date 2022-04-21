#!/bin/bash
# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install starship shell
curl -sS https://starship.rs/install.sh | sh

# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Symlink configs
ln -s ./zshrc ~/.zshrc
