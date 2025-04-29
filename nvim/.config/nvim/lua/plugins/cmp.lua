-- [nfnl] Compiled from fnl/plugins/cmp.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local cmp = require("cmp")
  local lspkind = require("lspkind")
  local lkind = lspkind.cmp_format({mode = "symbol_text", maxwidth = 50})
  local luasnip = require("luasnip")
  local friendly_snippets = require("luasnip.loaders.from_vscode")
  local function _2_(args)
    return luasnip.lsp_expand(args.body)
  end
  local function _3_(entry, item)
    local kind = lkind(entry, item)
    local strings = vim.split(kind.kind, "%s", {trimepty = true})
    kind.kind = (" " .. (strings[1] or "") .. " ")
    kind.menu = (" " .. (strings[2] or "") .. " ")
    return kind
  end
  local function _4_()
    local context = require("cmp.config.context")
    return (not context.in_treesitter_capture("string") and not context.in_syntax_group("String"))
  end
  cmp.setup({snippet = {expand = _2_}, mapping = {["<C-p>"] = cmp.mapping.select_prev_item(), ["<C-n>"] = cmp.mapping.select_next_item(), ["<C-b>"] = cmp.mapping.scroll_docs(( - 4)), ["<C-f>"] = cmp.mapping.scroll_docs(4), ["<C-Space>"] = cmp.mapping.complete(), ["<C-e>"] = cmp.mapping.close(), ["<CR>"] = cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Insert, select = true})}, window = {documentation = cmp.config.window.bordered(), completion = cmp.config.window.bordered()}, formatting = {fields = {"kind", "abbr", "menu"}, format = _3_}, sources = {{name = "nvim_lsp"}, {name = "luasnip", group_index = 1, option = {use_show_condition = true}, entry_filter = _4_}, {name = "buffer"}, {name = "conjure"}}})
  cmp.setup.cmdline({"/", "?"}, {mapping = cmp.mapping.preset.cmdline(), sources = {name = "buffer"}})
  cmp.setup.cmdline({":"}, {mapping = cmp.mapping.preset.cmdline(), sources = cmp.config.sources({{name = "path"}}, {{name = "cmdline"}})})
  return friendly_snippets.lazy_load()
end
return {{"hrsh7th/cmp-nvim-lsp"}, {"hrsh7th/cmp-buffer"}, {"hrsh7th/cmp-path"}, {"hrsh7th/cmp-cmdline"}, {"saadparwaiz1/cmp_luasnip"}, {"L3MON4D3/LuaSnip", dependencies = {"rafamadriz/friendly-snippets"}}, {"hrsh7th/nvim-cmp", dependencies = {"onsails/lspkind.nvim"}, config = _1_}}
