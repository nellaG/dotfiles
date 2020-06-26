# Path to Oh My Fish install.
set -gx OMF_PATH "/Users/$USER/.local/share/omf"

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG "/Users/gallen/.config/omf"

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

eval (python -m virtualfish compat_aliases)

set -gx OPENSSL_LIB_DIR "/usr/local/opt/openssl/lib"
set -gx POWERLINE_COMMAND "powerline"
set -gx POWERLINE_ROOT "/Users/$USER/powerline"
set -gx TMUX_CONFIG_DIRECTORY "/Users/$USER/.config/powerline"


set -gx OPENSSL_INCLUDE_DIR "/usr/local/opt/openssl/include"

set -gx PATH "/usr/local/lib/python2.7/site-packages/PySide" $PATH
set -g fish_user_paths "/usr/local/opt/postgresql@9.6/bin" $fish_user_paths

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

set -gx XDG_CONFIG_DIRS "/Library/Python/2.7/site-packages"

set -gx PATH "/Users/$USER/.pyenv/shims" $PATH

set -gx PYENV_SHELL fish
source '/usr/local/Cellar/pyenv/1.2.4/libexec/../completions/pyenv.fish'
command pyenv rehash 2>/dev/null
function pyenv
  set command $argv[1]
  set -e argv[1]

  switch "$command"
  case activate deactivate rehash shell
    source (pyenv "sh-$command" $argv|psub)
  case '*'
    command pyenv "$command" $argv
  end
end

set fish_color_normal "#FFFFFF"
set fish_color_command "#4FAA96"
set fish_color_param "#72F4D7"
set fish_color_autosuggestion "#C6FAEF"
set fish_color_error "#F47293"
