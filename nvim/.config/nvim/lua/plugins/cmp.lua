return {
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },
  { "saadparwaiz1/cmp_luasnip" },
  { "L3MON4D3/LuaSnip",        dependencies = { "rafamadriz/friendly-snippets" } },
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "onsails/lspkind.nvim" },
    config = function()
      local cmp = require("cmp")
      local lspkind = require("lspkind")
      local lkind = lspkind.cmp_format({ mode = "symbol_text", maxwidth = 50 })
      local luasnip = require("luasnip")
      local friendly_snippets = require("luasnip.loaders.from_vscode")

      cmp.setup({
        snippet = {
          expand = function(args)
            return luasnip.lsp_expand(args.body)
          end,
        },
        mapping = {
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.close(),
          ["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }),
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        },
        window = { documentation = cmp.config.window.bordered(), completion = cmp.config.window.bordered() },
        formatting = {
          fields = { "kind", "abbr", "menu" },
          format = function(entry, item)
            local kind = lkind(entry, item)
            local strings = vim.split(kind.kind, "%s", { trimepty = true })
            kind.kind = (" " .. (strings[1] or "") .. " ")
            kind.menu = (" " .. (strings[2] or "") .. " ")
            return kind
          end,
        },
        sources = {
          { name = "nvim_lsp" },
          {
            name = "luasnip",
            group_index = 1,
            option = { use_show_condition = true },
            entry_filter = function()
              local context = require("cmp.config.context")
              return (
                not context.in_treesitter_capture("string") and not context.in_syntax_group("String")
              )
            end,
          },
          { name = "buffer" },
          { name = "conjure" },
        },
      })
      cmp.setup.cmdline({ "/", "?" }, { mapping = cmp.mapping.preset.cmdline(), sources = { name = "buffer" } })
      cmp.setup.cmdline({ ":" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
      })
      return friendly_snippets.lazy_load()
    end,
  },
}
