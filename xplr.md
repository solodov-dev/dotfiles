---
title: Xplr file manager config
author: Andrey Solodov
tangle: ~/.config/xplr/init.lua
---

## Base config

XPM - xplr plugin manager. If not installed will be installed automatically.

```lua
local home = os.getenv("HOME")
local xpm_path = home .. "/.local/share/xplr/dtomvan/xpm.xplr"
local xpm_url = "https://github.com/dtomvan/xpm.xplr"
version = "0.21.3"

package.path = package.path
  .. ";"
  .. xpm_path
  .. "/?.lua;"
  .. xpm_path
  .. "/?/init.lua"

os.execute(
  string.format(
    "[ -e '%s' ] || git clone '%s' '%s'",
    xpm_path,
    xpm_url,
    xpm_path
  )
)

require("xpm").setup({
    plugins = {
	    "dtomvan/xpm.xplr",
	    "prncss-xyz/icons.xplr",
        "gitlab:hartan/web-devicons.xplr"
    },
    auto_install = true,
    auto_cleanup = true
})
```
