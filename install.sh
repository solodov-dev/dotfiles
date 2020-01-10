# install packages
sudo pacman -S git gvim ttf-fira-code nodejs npm firefox zsh 

# install ohmyzsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install vimplug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# create folders for dotfiles
mkdir -p .vim .config/coc/ultisnips
rm .config/i3/config

# stow dotfiles
stow * 
