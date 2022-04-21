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

# Gitpod configuration for zsh
if ! grep 'PROMPT_COMMAND=".*exec zsh"' "$HOME/.bashrc" 1>/dev/null; then {
    # The supervisor creates the task terminals, supervisor calls BASH from `/bin/bash` instead of the realpath `/usr/bin/bash`
    # shellcheck disable=SC2016
    printf '%s\n' 'PROMPT_COMMAND="[ "$BASH" == /bin/bash ] && [ "$PPID" == "$(pgrep -f "supervisor run" | head -n1)" ] && test -v bash_ran && exec zsh || bash_ran=true;$PROMPT_COMMAND"' >> "$HOME/.bashrc";
} fi
