#!/usr/bin/env bash
#
# Author: Ibahim Mkusa
# About: setup dotfiles

set -e
cd ~
sudo apt update -yy && sudo apt upgrade -yy

# install build essential libs
sudo apt install -y build-essential cmake python3-dev

# install core programs
sudo apt install -y vim-nox git tmux neofetch curl ranger silversearcher-ag \
  direnv glances gedit-plugins zsh

# prompt to install tmux plugin manager
echo -n "Install tmuxifier[yes/no]?"
read -r response
if [[ "$response" == "yes" ]]; then
  git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier || true
fi

# Install tpm
echo -n "Install tmux plugin manager[yes/no]?"
read -r response
if [[ "$response" == "yes" ]]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm || true 
fi

# Change Shell to zsh
echo -n "Change shell to zsh[yes/no]?"
read -r response
if [[ "$response" == "yes" ]]; then
  chsh -s /usr/bin/zsh
fi

# link files using stow
rm -rf ~/.bashrc ~/.bash_profile ~/.zshrc
cd ~/dotfiles-public
stow bash git ranger shellenv tmux vim zsh
cd -

# install the only fonts you'll need :>
cd ~/dotfiles-public/fonts/fonts
chmod u+x install.sh
./install.sh
cd ~



echo "Good luck, Amigo!!"


