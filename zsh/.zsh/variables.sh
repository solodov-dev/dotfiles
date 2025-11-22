export EDITOR='vim'
export VISUAL='vim'

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"

#HISTORY
export HISTFILE="$HOME/.bash_history"   # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file

#PROMPT
# ౷ / (҂◡_◡) ᕤ
export PS1="(҂◡_◡)ᕤ "
export RPS1=$(git branch --show-current)
