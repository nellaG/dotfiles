# Path to Oh My Fish install.
set -gx OMF_PATH "/Users/valerie/.local/share/omf"

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG "/Users/valerie/.config/omf"

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

eval (python -m virtualfish compat_aliases)

set -gx OPENSSL_LIB_DIR "/usr/local/opt/openssl/lib"

set -gx OPENSSL_INCLUDE_DIR "/usr/local/opt/openssl/include"

set -gx PATH "/usr/local/lib/python2.7/site-packages/PySide" $PATH
set -g fish_user_paths "/usr/local/opt/postgresql@9.6/bin" $fish_user_paths

set -gx GEM_HOME $HOME/.gem

set -gx PATH $GEM_HOME/bin $PATH

set -gx PATH "/Users/valerie/.cargo/bin" $PATH
set -gx PATH "/Users/valerie/sip" $PATH

set -gx LDFLAGS "-L/usr/local/opt/openssl/lib"

set -gx CPPFLAGS "-I/usr/local/opt/openssl/include"
set -gx PKG_CONFIG_PATH "/usr/local/opt/openssl/lib/pkgconfig"

set -g fish_user_paths "/usr/local/opt/openssl/bin" $fish_user_paths

set -gx RUST_SRC_PATH "/Users/valerie/.rustup/toolchains/nightly-x86_64-apple-darwin/lib/rustlib/src/rust/src"

set fish_color_normal "#FFFFFF"
set fish_color_command "#4FAA96"
set fish_color_param "#72F4D7"
set fish_color_autosuggestion "#C6FAEF"
set fish_color_error "#F47293"
