-- [nfnl] Compiled from fnl/plugins/format.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local conform = require("conform")
  return conform.setup({formatters_by_ft = {lua = {"stylua"}, python = {"isort", "black"}, javascript = {"prettierd", "prettier", stop_after_first = true}, javascriptreact = {"prettierd", "prettier", stop_after_first = true}, typescriptreact = {"prettierd", "prettier", stop_after_first = true}, html = {"prettierd", "prettier", stop_after_first = true}, css = {"prettierd", "prettier", stop_after_first = true}, json = {"prettierd", "prettier", stop_after_first = true}, markdown = {"prettierd", "prettier", stop_after_first = true}, graphql = {"prettierd", "prettier", stop_after_first = true}, svelte = {"prettierd", "prettier", stop_after_first = true}, rust = {"rustfmt", lsp_format = "fallback"}, fennel = {"fnlfmt"}}, format_on_save = {timeout_ms = 2500, lsp_fallback = true}})
end
return {{"stevearc/conform.nvim", config = _1_}}
