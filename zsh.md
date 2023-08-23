# Zsh config

This is a literate zsh config. Please tangle to create a ~/.zshrc file.

## Oh-my-zsh framework
```sh
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
```

## Theme
```sh
if [[ ! -d ${ZSH_CUSTOM}/themes/minimal ]]
then
  echo "Installing minimal theme"
  git clone https://github.com/subnixr/minimal.git  ${ZSH_CUSTOM}/themes/minimal
  ln -s ${ZSH_CUSTOM}/themes/minimal/minimal.zsh ${ZSH_CUSTOM}/themes/minimal.zsh-theme
  echo "Theme installed"
fi

ZSH_THEME="minimal"
```

## Variables
```sh
EDITOR='vim'
```

## Aliases
```sh
alias vim=nvim
alias zsource="source ~/.zshrc"
alias zconfig="vim ~/.dotfiles/zsh.norg"
alias vconfig="cd ~/.config/nvim && vim ."
alias dotfiles="cd ~/.dotfiles && vim ." 
alias off=poweroff
```

## Git aliases
```sh
alias gupdate="git add . && git commit -m 'Update `date +"%d/%m/%Y %H:%M"`' && git push origin master"
alias gtree="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gprune="git fetch --prune && git branch --merged >/tmp/merged-branches && vi /tmp/merged-branches && xargs git branch -d </tmp/merged-branches"
alias gstat="git -C status"
```

## Functions
```sh
mkcd () {
  mkdir "$1"
  cd "$1"
}
```

## Plugins
```sh
plugins=(git)
```

## Tools

### NVM
```sh
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
```

### Cargo
```sh
path+=$HOME/.cargo/bin/
```

### GHCup env
```sh
[ -f "/home/andrey/.ghcup/env" ] && source "/home/andrey/.ghcup/env"
```
