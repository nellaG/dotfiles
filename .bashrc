alias ls="ls -G"

# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true

# cache pip-installed packages to avoid re-downloading
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

# NOTE(gallen): code to restrict pip to virtual environments.
syspip(){
  PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

alias grep='grep --color=auto'

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
