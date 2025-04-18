-- [nfnl] Compiled from fnl/plugins/theme.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  return vim.cmd("colorscheme tokyonight-night")
end
return {{"folke/tokyonight.nvim", priority = 1000, config = _1_, lazy = false}}
