---
title: Tmux config
author: Andrey Solodov
tangle: ~/.config/tmux/tmux.conf
---

## Plugins

```
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'christoomey/vim-tmux-navigator'
```

## Run

```
run '~/.tmux/plugins/tpm/tpm'
```
