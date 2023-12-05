---
title: Zsh config
author: Andrey Solodov
tangle: ~/.zshrc
---

## Variables

```sh
EDITOR='vim'
ZSH_THEME="minimal"
```

## Oh-my-zsh framework

Export oh-my-zsh dir

```sh
export ZSH="$HOME/.oh-my-zsh"
```

If oh-my-zsh is not isntalled, install it

```sh
if [[ ! -d ${ZSH} ]]
then
  echo "Installing oh-my-zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --keep-zshrc
fi
```

Source

```sh
source $ZSH/oh-my-zsh.sh
```

## Theme

If theme is not installed, install it

```sh
if [[ ! -d ${ZSH_CUSTOM}/themes/minimal ]]
then
  echo "Installing minimal theme"
  git clone https://github.com/subnixr/minimal.git  ${ZSH_CUSTOM}/themes/minimal
  ln -s ${ZSH_CUSTOM}/themes/minimal/minimal.zsh ${ZSH_CUSTOM}/themes/minimal.zsh-theme
  echo "Theme installed"
fi
```

## Aliases

```sh
alias vim=nvim
alias v=nvim
alias zsource="source ~/.zshrc"
alias zconfig="cd ~/.dotfiles && vim zsh.md"
alias vconfig="cd ~/.config/nvim && vim ."
alias dotfiles="cd ~/.dotfiles && vim ."
alias off=poweroff
alias tangle="~/.dotfiles/tangle"
alias dot="cd ~/.dotfiles"
alias g=lazygit
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


takeout () {
  mv $1/* .
  rm -rf "$1"
}
```

## Tools

### NVM

```sh
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
if [[ ! -d $NVM_DIR ]]
then
  echo "Installing NVM"
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
fi
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
```

### GHCup env

```sh
[ -f "/home/andrey/.ghcup/env" ] && source "/home/andrey/.ghcup/env"
```

### Kitty SSH

When kitty is used to ssh into a remote that does not have its terminfo, various issues can occur. The solution is normally to copy over the terminfo. Kitty has an ssh kitten to automate exactly this.

```sh
[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"
```

## Plugins

```sh
plugins=(git vi-mode)
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
```

## Path

```sh
path+="$(yarn global bin)"
path+=/usr/local/go/bin/
path+=$HOME/.cargo/bin/
```
