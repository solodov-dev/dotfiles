-- [nfnl] Compiled from fnl/plugins/treesitter.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local ts = require("nvim-treesitter.configs")
  return ts.setup({highlight = {enable = true}, indent = {enable = true}, ensure_installed = {"rust", "lua", "fennel", "vim", "vimdoc", "query", "css", "javascript", "html", "typescript", "markdown", "bash", "tsx", "clojure", "dockerfile", "yaml", "java"}})
end
return {{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate", config = _1_}}
