# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="pygmalion"


plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="$PATH:$HOME/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"
export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

alias ls='ls -G --color'
alias grep='grep --color=auto'

if [ "$TMUX" = "" ]; then
  export TERM="xterm-256color"
fi

#
# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true

# cache pip-installed packages to avlid re-downloading
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
