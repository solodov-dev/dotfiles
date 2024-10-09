## Variables

EDITOR='vim'
ZSH_THEME="minimal"

## Oh-my-zsh framework

## Export oh-my-zsh dir

export ZSH="$HOME/.oh-my-zsh"

## If oh-my-zsh is not isntalled, install it

if [[ ! -d ${ZSH} ]]
then
  echo "Installing oh-my-zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --keep-zshrc
fi

## Source

source $ZSH/oh-my-zsh.sh

## Theme

## If theme is not installed, install it

if [[ ! -d ${ZSH_CUSTOM}/themes/minimal ]]
then
  echo "Installing minimal theme"
  git clone https://github.com/subnixr/minimal.git  ${ZSH_CUSTOM}/themes/minimal
  ln -s ${ZSH_CUSTOM}/themes/minimal/minimal.zsh ${ZSH_CUSTOM}/themes/minimal.zsh-theme
  echo "Theme installed"
fi

## Aliases

alias vim=nvim
alias v=nvim
alias source-zsh="source ~/.zshrc"
alias off=poweroff
alias dot="cd ~/.dotfiles"
alias dwn="cd ~/Downloads"
alias doc="cd ~/Documents"

## Git aliases

alias gupdate="git add . && git commit -m 'Update `date +"%d/%m/%Y %H:%M"`' && git push origin master"
alias gtree="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gprune="git fetch --prune && git branch --merged >/tmp/merged-branches && vi /tmp/merged-branches && xargs git branch -d </tmp/merged-branches"
alias gstat="git status"

## Functions

mkcd () {
  mkdir "$1"
  cd "$1"
}


## Tools

## NVM

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
if [[ ! -d $NVM_DIR ]]
then
  echo "Installing NVM"
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
fi
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

## Plugins

plugins=(git vi-mode)
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true

## Load local settings
for FILE in ~/.zshconfig/*; do
  source $FILE
done

[ -f "/Users/a.m.solodov/.ghcup/env" ] && . "/Users/a.m.solodov/.ghcup/env" # ghcup-env