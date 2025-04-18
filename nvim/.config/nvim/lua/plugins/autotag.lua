-- [nfnl] Compiled from fnl/plugins/autotag.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local autotag = require("nvim-ts-autotag")
  return autotag.setup({})
end
return {{"windwp/nvim-ts-autotag", config = _1_}}
