# Programs
alias vim=nvim
alias v=nvim
alias off=poweroff

# Zsh
alias zconf="vim $HOME/.config/zsh"
alias zsource="source ~/.zshrc"

# Navigation
setopt autocd
alias dot="$HOME/.dotfiles"
alias dow="$HOME/Downloads"
alias doc="$HOME/Documents"
alias cod="$HOME/code"

# Git
alias gupdate="git add . && git commit -m 'Update `date +"%d/%m/%Y %H:%M"`' && git push origin master"
alias gtree="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gprune="git fetch --prune && git branch --merged >/tmp/merged-branches && vi /tmp/merged-branches && xargs git branch -d </tmp/merged-branches"
alias gstat="git status"
alias g=lazygit
