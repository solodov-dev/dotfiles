-- [nfnl] Compiled from fnl/plugins/statusline.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local lualine = require("lualine")
  return lualine.setup({options = {theme = "auto"}})
end
return {{"nvim-lualine/lualine.nvim", name = "lualine", dependencies = {"nvim-tree/nvim-web-devicons"}, config = _1_}}
