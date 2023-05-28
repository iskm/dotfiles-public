#!/usr/bin/env bash
#
# Author: Ibrahim Mkusa
# About: setup dotfiles

# Asks whether user is on a ubuntu or fedora distribution
echo -n "Are you on [ubuntu/fedora]"
read -r response
if [[ "$response" == "ubuntu" ]]; then
  manager="apt"
  vim="vim-nox" 
  # install build essential libs
  sudo apt install -y build-essential cmake python3-dev
elif [[ "$response" == "fedora" ]]; then
  manager="dnf"
  vim="vim-enhanced"
  sudo dnf install -y make automake gcc gcc-c++ kernel-devel \
    cmake python3-devel 
else
  echo "No distro-specified. Exitting .."
  exit 1
fi


set -e
cd ~
sudo $manager update -y && sudo $manager upgrade -y


# install core programs
sudo $manager install -y $vim git tmux neofetch curl ranger silversearcher-ag \
  direnv glances gedit-plugins zsh stow

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
  chsh -s $(which zsh)
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


                   #,.ood888888888888boo.,
              #.od888P^""            ""^Y888bo.
          #.od8P''   ..oood88888888booo.    ``Y8bo.
       #.odP'"  .ood8888888888888888888888boo.  "`Ybo.
     #.d8'   od8'd888888888f`8888't888888888b`8bo   `Yb.
    #d8'  od8^   8888888888[  `'  ]8888888888   ^8bo  `8b
  #.8P  d88'     8888888888P      Y8888888888     `88b  Y8.
 #d8' .d8'       `Y88888888'      `88888888P'       `8b. `8b
#.8P .88P            """"            """"            Y88. Y8.
#88  888                                              888  88
#88  888                                              888  88
#88  888.        ..                        ..        .888  88
#`8b `88b,     d8888b.od8bo.      .od8bo.d8888b     ,d88' d8'
 #Y8. `Y88.    8888888888888b    d8888888888888    .88P' .8P
  #`8b  Y88b.  `88888888888888  88888888888888'  .d88P  d8'
    #Y8.  ^Y88bod8888888888888..8888888888888bod88P^  .8P
     #`Y8.   ^Y888888888888888LS888888888888888P^   .8P'
       #`^Yb.,  `^^Y8888888888888888888888P^^'  ,.dP^'
          #`^Y8b..   ``^^^Y88888888P^^^'    ..d8P^'
              #`^Y888bo.,            ,.od888P^'
                   #"`^^Y888888888888P^^'"

