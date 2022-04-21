#!/bin/bash
# Install oh-my-zsh
[ ! -d "$HOME/.oh-my-zsh" ] && sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install starship shell
if ! [ -x "$(command -v starship)" ]; then
  curl -sS https://starship.rs/install.sh | sh
fi


# Install fzf
if ! [ -x "$(command -v fzf)" ]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
fi

# Symlink configs
[ ! -L "$HOME/.zshrc" ] && ln -s ./zshrc ~/.zshrc
echo "exec zsh" >> ~/.bashrc
