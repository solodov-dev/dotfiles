---
title: Tmux config
author: Andrey Solodov
tangle: ~/.tmux.conf
---

## Set true color
```sh
set-option -sa terminal-overrides ",xterm*:Tc"
```

## Windows numbering
```sh
set -g base-index 1
set -g pane-base-index 1
set-window-option -g pane-base-index 1
set-option -g renumber-windows on
set-window-option -g mode-keys vi
```

## Set prefix
```sh
unbind C-b
set -g prefix C-Space
```

## Mouse support
```sh
set -g mouse on
```

## Split in current dir
```sh
bind '"' split-window -v -c "#{pane_current_path}"
bind % split-window -h -c "#{pane_current_path}"
```

## Shift Alt vim keys to switch windows
```sh
bind -n M-H previous-window
bind -n M-L next-window
```

## Plugins
```sh
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'christoomey/vim-tmux-navigator'
```

## Theme
```sh
set -g @plugin 'janoamaral/tokyo-night-tmux'
set -g @tokyo-night-tmux_show_datetime 0
set -g @tokyo-night-tmux_date_format DMY
set -g @tokyo-night-tmux_time_format 24H
set -g @tokyo-night-tmux_show_path 1
set -g @tokyo-night-tmux_path_format relative # 'relative' or 'full'
```

## Run
```sh
run '~/.tmux/plugins/tpm/tpm'
```
