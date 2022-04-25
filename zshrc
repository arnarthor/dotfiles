# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"
eval $(/opt/homebrew/bin/brew shellenv)

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
if [[ "$OSTYPE" == "darwin"* ]]; then 
  plugins=(
      git	
      bazel
      autojump
      aws
  )

  export NVM_DIR="$HOME/.nvm" 
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:node_modules/.bin:/opt/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH:/Users/arnarthor/.opam/4.02.3/bin:/Users/arnarthor/.cargo/bin:/Applications/Postgres.app/Contents/Versions/latest/bin:$HOME/go/bin"
  [ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh
else 
  plugins=(
      git
      bazel
      aws
  )
fi


source $ZSH/oh-my-zsh.sh
ulimit -n 4000

export EDITOR='code'

fpath=(~/.zsh/completions $fpath)

if [[ "$OSTYPE" == "darwin"* ]]; then 
  export LC_ALL=en_US.UTF-8
  export LANG=en_US.UTF-8
  export LDFLAGS="-L/opt/homebrew/opt/libpq/lib -L$(brew --prefix openssl@1.1)/lib"
  export CFLAGS="-I$(brew --prefix openssl@1.1)/include"
  export CPPFLAGS="-I/opt/homebrew/opt/libpq/include"


  defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
  defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)
  defaults write -g ApplePressAndHoldEnabled -bool false
  alias bazel=bazelisk
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

APOLLO_TELEMETRY_DISABLED=1
