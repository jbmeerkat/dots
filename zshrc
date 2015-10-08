# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

if [ -n "$DISPLAY" -a "$TERM" = "xterm" ]; then
  export TERM=xterm-256color
fi

alias tmux="TERM=screen-256color-bce tmux"

export EDITOR='nvim'

fpath+=("/usr/local/share/zsh/site-functions")

autoload -U promptinit && promptinit
prompt pure

ZSH_THEME="pure"

plugins=(gem brew rvm git rails bundler git-flow ruby vagrant pip python lein zsh-syntax-highlighting vi-mode tmux tmuxinator)

source $ZSH/oh-my-zsh.sh

export LC_ALL=en_GB.UTF-8
export LANG=en_GB.UTF-8

bindkey '^r' history-incremental-search-backward

eval "$(rbenv init -)"

### Added by the Heroku Toolbelt
export PATH="/usr/local/bin:/usr/local/heroku/bin:$PATH"

### Added npm binaries
export PATH="/usr/local/share/npm/bin:$PATH"

### Added for xmllint
export XML_CATALOG_FILES="/usr/local/etc/xml/catalog"
export PATH="/usr/local/sbin:$PATH"

if [ -f ~/.aliases ]; then
  . ~/.aliases
fi

if [ -f ~/.zsh_login ]; then
  . ~/.zsh_login
fi

export NVM_DIR="/Users/alex/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
