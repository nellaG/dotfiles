# Load oh-my-posh configuration.
oh-my-posh init fish --config /Users/$USER/powerline10k_rainbow_fish.omp.json | source

set -g VIRTUALFISH_PYTHON "/usr/local/bin/python3"
set -g VIRTUALFISH_PLUGINS "auto_activation compat_aliases"
set -g VIRTUALFISH_HOME "/Users/$USER/venvwrappers"

set -gx OPENSSL_LIB_DIR "/usr/local/opt/openssl/lib"

set -gx OPENSSL_INCLUDE_DIR "/usr/local/opt/openssl/include"

set -gx NVM_DIR "/Users/$USER/.nvm"
set -gx NODE_VER (echo (node --version) | cut -d "v" -f2)
set -gx NODE_RUNTIME "/usr/local/n/versions/node/$NODE_VER/bin"
set -gx PATH $NVM_DIR $PATH
set -gx PATH $NODE_RUNTIME $PATH

set -gx GEM_HOME $HOME/.gem

set -gx PATH $GEM_HOME/bin $PATH

set -gx PATH "/Users/$USER/.cargo/bin" $PATH
set -gx PATH "/Users/$USER/sip" $PATH

set -gx LDFLAGS "-L/usr/local/opt/openssl/lib"

set -gx CPPFLAGS "-I/usr/local/opt/openssl/include"
set -gx PKG_CONFIG_PATH "/usr/local/opt/openssl/lib/pkgconfig"

set -g fish_user_paths "/usr/local/opt/openssl/bin" $fish_user_paths

set -gx RUST_SRC_PATH "/Users/$USER/.rustup/toolchains/nightly-x86_64-apple-darwin/lib/rustlib/src/rust/src"

set fish_color_normal "#FFFFFF"
set fish_color_command "#4FAA96"
set fish_color_param "#72F4D7"
set fish_color_autosuggestion "#C6FAEF"
set fish_color_error "#F47293"
set -gx TMUX_POWERLINE_THEME bubble

# to override ls command
alias ls="exa -alh --color=always"
alias cat="bat --theme=Dracula"
alias goot='cd $(eval "git root")'
alias gl='git log'
alias ag='rg'
alias black="black --color"
alias da='django-admin'
export WORKON_HOME=$HOME/venvwrappers
export KUBE_EDITOR=nvim
#export BAT_PAGER='less -RFS'  dont set (weird behavior)
#
export AWS_ACCOUNT_ID=''

# for gotest colorization
export GOTEST_PALETTE="hired,hicyan"

export GITSTATUS_LOG_LEVEL=DEBUG
eval "$(atuin init fish)"
export DATABASE_HASH=''
export NOTION_KEY=''
export NPM_TOKEN=''
alias shfmt='shfmt -i 2'


alias cpls='cat ~/dotfiles/cplist.yaml'

