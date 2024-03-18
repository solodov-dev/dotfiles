---
title: WezTerm config
author: Andrey Solodov
tangle: ~/.wezterm.lua
---

Pull in the wezterm API
```lua
local wezterm = require 'wezterm'
```

This table will hold the configuration.
```lua
local config = {}
```

In newer versions of wezterm, use the config_builder which will help provide clearer error messages
```lua
if wezterm.config_builder then
  config = wezterm.config_builder()
end
```

This is where you actually apply your config choices
```lua
config.color_scheme = 'Tokyo Night'
config.hide_tab_bar_if_only_one_tab = true
config.font = wezterm.font 'Fira Code Nerd Font'
```

## Keys
```lua
config.keys = {
    {
        key = 'n',
        mods = 'SHIFT|CTRL',
        action = wezterm.action.ToggleFullScreen,
    },
}
```

And finally, return the configuration to wezterm
```lua
return config
```
