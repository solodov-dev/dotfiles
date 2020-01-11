# install packages
sudo pacman -S git gvim ttf-fira-code nodejs npm firefox zsh polybar

# install ohmyzsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install vimplug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# create folders for dotfiles
# folder for coc.nvim snippets
mkdir -p .vim .config/coc/ultisnips

# remove default i3 config file before stowing
rm .config/i3/config

# make dir for polybar config
mkdir -p .config/polybar

# stow dotfiles
stow * 
