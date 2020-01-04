# My dotfiles
## Dotfiles for bash, vim, zsh etc.

Usage:
```bash
#Install zsh
sudo apt install zsh

#Install oh-my-zsh!
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#Install stow
sudo apt install stow

#Clone dotfiles repo into the $HOME directory
git clone git@github.com:solodov-dev/dotfiles.git

#Cd into dotfiles and stow everything
cd dotfiles
stow *

#Install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#In vim
:PluginInstall
```
