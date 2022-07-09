#!/bin/sh

# create ssh key
#ssh-keygen -t ed25519 -C "seirios0107@gmail.com"

# install neovim
# if ubuntu is older than 18.04: download release
wget https://github.com/neovim/neovim/releases/download/v0.4.4/nvim.appimage
chmod u+x nvim.appimage && ./nvim.appimage
sudo mv nvim.appimage /usr/bin/nvim
#sudo apt-get install python-software-properties
#sudo add-apt-repository ppa:neovim-ppa/stable
#sudo apt-get update

# clone dotfile
#git clone git@github.com:nellaG/dotfiles.git

# install screenfetch
sudo apt install screenfetch

# install exa
wget https://github.com/ogham/exa/releases/download/v0.9.0/exa-linux-x86_64-0.9.0.zip
unzip exa-linux-x86_64-0.9.0.zip
sudo mv exa-linux-x86_64 /usr/bin/exa

# install bat, delta, fd, zoxide
wget https://github.com/sharkdp/bat/releases/download/v0.17.1/bat_0.17.1_amd64.deb
sudo dpkg -i bat_0.17.1_amd64.deb

#wget https://github.com/dandavison/delta/releases/download/0.5.1/git-delta_0.5.1_amd64.deb
#sudo dpkg -i git-delta_0.5.1_amd64.deb

wget https://github.com/sharkdp/fd/releases/download/v8.2.1/fd_8.2.1_amd64.deb
sudo dpkg -i fd_8.2.1_amd64.deb

wget https://github.com/sharkdp/vivid/releases/download/v0.6.0/vivid_0.6.0_amd64.deb
sudo dpkg -i vivid_0.6.0_amd64.deb

# install curl
sudo apt install -y curl


# neovim configuration
mkdir -p .config/nvim
cp dotfiles/init.vim .config/nvim/init.vim

# install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# install vimplug packages
nvim -c "PlugInstall" -c wq

cp coc-settings.json to ~/.config/nvim
cp dotfiles/coc-settings.json ~/.config/nvim/

# install coc
nvim -c "CocInstall coc-python coc-rls coc-go coc-git coc-eslint coc-diagnostic coc-tsserver coc-sh coc-snippets coc-pyright" -c wq


# install Hack nerd fonts
wget https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip

# install unzip
sudo apt install unzip

unzip Hack-v3.003-ttf.zip

sudo cp ttf/Hack* /usr/share/fonts/

# regenerate font cache
fc-cache -f -v

fc-list | grep Hack

# install zplug
#curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

# install p10k zsh theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

#install auto suggestion
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions


# .zshrc copy
cp dotfiles/.zshrc $HOME/.zshrc
cp dotfiles/.p10k.zsh $HOME/.p10k.zsh
source $HOME/.zshrc
# cp dotfile tmux zsh to home directory
cp dotfiles/.tmux.conf $HOME/.tmux.conf

# install powerline for tmux
git clone git@github.com:powerline/powerline.git --depth 1



# install python3.8
sudo apt install python3.8
# change default python to python3.8
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.8 1
sudo update-alternatives --install /usr/bin/python python /usr/bin/python2.7 2
sudo update-alternatives --config python

# change default python3 to python3.8
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 1
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.5 2
sudo update-alternatives --config python3

# uninstall python3.5
sudo apt remove python3.5

sudo apt install python3-apt
sudo apt install software-properties-common

# install pip
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo apt-get install python3.8-distutils
python get-pip.py
sudo apt install python3-pip

# change d efault pip to pip3
#sudo update-alternatives --install /usr/bin/pip pip /home/gallen/.local/bin/pip3 1
#sudo update-alternatives --install /usr/bin/pip pip /home/gallen/.local/bin/pip 2
# sudo update-alternatives --config pip

# install virtualenvwrapper
sudo pip install virtualenvwrapper


# install awscli
sudo apt install awscli

# install zsh
#sudo apt install zsh

#install ohmyzsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install autosuggestion
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions


#install zoxide (zsh ver)
git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z

# install zsh zeta theme
bash -c "$(curl -fsSL https://raw.githubusercontent.com/skylerlee/zeta-zsh-theme/master/scripts/install.sh)"

# powerline status

sudo pip install powerline-status

# install npm, n
sudo apt install -y npm
sudo npm install -g n

# install node lts
sudo n lts
