export EDITOR='vim'
export VISUAL='vim'

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"

#HISTORY
export HISTFILE="$HOME/.bash_history"   # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file
setopt HIST_SAVE_NO_DUPS                # Do not write a duplicate event to the history file.

