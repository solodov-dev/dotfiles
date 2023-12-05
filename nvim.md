---
title: Neovim config
author: Andrey Solodov
tangle: ~/.config/nvim/init.lua
---

## Settings

Some global settings such as `<leader>` key, tabstops, etc.

```lua
vim.g.mapleader = " "
vim.g.netrw_preview = 1
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.softtabstop = 2
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"
vim.opt.clipboard = "unnamedplus"
```

## Keymaps

```lua
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- move line down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- move line up
vim.keymap.set("n", "J", "mzJ`z") -- connect line without moving the coursor
```

## Plugins

Init lazy.nvim plugin manager.

```lua
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
```

### List of plugins

A table with all the plugins we are going to install.

```lua
local plugins = {}
```

### Themes

Add some themes.

```lua
table.insert(plugins, {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
})

table.insert(plugins, {
  "ellisonleao/gruvbox.nvim", priority = 1000
})
```

### Lsp

Setup language servers

```lua
table.insert(plugins, {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  dependencies = {
    -- LSP Support
    { 'neovim/nvim-lspconfig' },             -- Required
    { 'williamboman/mason.nvim' },           -- Optional
    { 'williamboman/mason-lspconfig.nvim' }, -- Optional

    -- Autocompletion
    { 'hrsh7th/nvim-cmp' },     -- Required
    { 'hrsh7th/cmp-nvim-lsp' }, -- Required
    { 'L3MON4D3/LuaSnip' },     -- Required
  },
  config = function()
    local lsp = require('lsp-zero').preset({})

    -- (Optional) Configure lua language server for neovim
    require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

    lsp.ensure_installed({
      'jsonls',
      'marksman',
      'dockerls',
      'docker_compose_language_service',
      'bashls',
      'cssls',
      'cssmodules_ls',
      'emmet_ls',
      'eslint',
      'lua_ls',
      'rust_analyzer',
      'tsserver',
      'hls',
      'yamlls' })

    lsp.setup()

    -- You need to setup `cmp` after lsp-zero
    local cmp = require('cmp')
    require('lsp-zero').cmp_action()

    cmp.setup({
      mapping = {
        -- `Enter` key to confirm completion
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        -- Ctrl+Space to trigger completion menu
        ['<C-Space>'] = cmp.mapping.complete(),
        -- Navigate between snippet placeholder
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-k>'] = cmp.mapping.select_prev_item(),
      }
    })
  end,
})
```

### NeoGit

Setup git integration.

```lua
table.insert(plugins, {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "nvim-telescope/telescope.nvim", -- optional
    "sindrets/diffview.nvim",        -- optional
  },
  config = true
})
```

### Trouble

List diagnostics in a nice quickfix list.

```lua
table.insert(plugins, {
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
})
```

### Comment

Fast comments.

```lua
table.insert(plugins, {
  'numToStr/Comment.nvim',
  opts = {
    -- add any options here
  },
  lazy = false,
})
```

### Lualine

Beautiful line.

```lua
table.insert(plugins, {
  'nvim-lualine/lualine.nvim',
  name = "lualine",
  dependencies = {
   'nvim-tree/nvim-web-devicons',
  },
  config = function ()
    require("lualine").setup {
      options = {
      -- ... your lualine config
      theme = 'gruvbox'
      -- ... your lualine config
      }
    }
  end,
})
```

### Barbecue

Show breadcrumbs at the top.

```lua
table.insert(plugins, {
  "utilyre/barbecue.nvim",
  name = "barbecue",
  version = "*",
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons", -- optional dependency
  },
  opts = {
    -- configurations go here
  },
  config = function()
    require("barbecue").setup {
      theme = 'tokyonight',
    }
  end,
})
```

### Surround

Surround object.

```lua
table.insert(plugins, {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
})
```

### Format

Formatter to work with different languages

```lua
table.insert(plugins, {
    'stevearc/conform.nvim',
     opts = {
         formatters_by_ft = {
            lua = { "stylua" },
            -- Conform will run multiple formatters sequentially
            python = { "isort", "black" },
            -- Use a sub-list to run only the first available formatter
            javascript = { { "prettierd", "prettier" } },
            javascriptreact = { { "prettierd", "prettier" } },
            typescript = { { "prettierd", "prettier" } },
            typescriptreact = { { "prettierd", "prettier" } },
            html = { { "prettierd", "prettier" } },
            css = { { "prettierd", "prettier" } },
            json = { { "prettierd", "prettier" } },
            markdown = { { "prettierd", "prettier" } },
            graphql = { { "prettierd", "prettier" } },
            svelte = { { "prettierd", "prettier" } },
            yaml = { { "prettierd", "prettier" } },
          },
        format_on_save = {
            -- These options will be passed to conform.format()
            timeout_ms = 500,
            lsp_fallback = true,
         },
    },
})
```

### Whichkey

Show hotkeys at the bottom in case you forgot.

```lua
table.insert(plugins, {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {},
  config = function()
    require('which-key').register({
      f = {
        name = "File",
        f = { "<cmd>Telescope find_files<cr>", "Find File (all)" },
        g = { "<cmd>Telescope git_files<cr>", "Git Files" },
        r = { "<cmd>Telescope live_grep<cr>", "Live grep" },
        b = { "<cmd>Telescope buffers<cr>", "Buffers" },
        u = { "<cmd>Telescope undo<cr>", "Undo tree" },
        h = { "<cmd>Telescope oldfiles<cr>", "History" },
        o = { "<cmd>Oil<cr>", "Oil (edit files as buffer)" },
        e = { vim.cmd.Ex, "File explorer" },
      },
      g = {
        name = "Git",
        g = { "<cmd>Neogit<cr>", "Git" },
      },
      l = {
        name = "LSP",
        I = { "<cmd>Mason<cr>", "Install" },
        d = { vim.lsp.buf.definition, "Definiion" },
        i = { vim.lsp.buf.implementation, "Implementation" },
        h = { vim.lsp.buf.hover, "Signature" },
        a = { vim.lsp.buf.code_action, "Actions" },
        r = { vim.lsp.buf.references, "References" },
        R = { vim.lsp.buf.rename, "Rename" },
        f = { function () require("conform").format({ async=true, lsp_fallback=true}) end, "Format" },
      },
      d = {
        name = "Diagnostics",
        h = { vim.diagnostic.open_float, "Open highlighted" },
        n = { vim.diagnostic.goto_next, "Next" },
        p = { vim.diagnostic.goto_prev, "Previous" },
        w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace" },
        d = { "<cmd>Trouble document_diagnostics<cr>", "Document" },
        q = { "<cmd>Trouble quickfix<cr>", "Quickfix" },
        l = { "<cmd>Trouble loclist<cr>", "Loclist" },
      },
      t = {
        name = "Terminal",
        t = { "<cmd>ToggleTerm direction=float<cr>", "Toggle" },
        v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
        h = { "<cmd>ToggleTerm direction=horizontal<cr>", "Horizontal" },
        g = { "<cmd>lua _lazygit_toggle()<cr>", "Git" },
        y = { "<cmd>lua _yarn_toggle()<cr>", "Yarn start" },
      },
      p = { "\"_dP", "Paste (delete to void)" },
      v = { function() vim.cmd.edit('~/.config/nvim/init.lua') end, "Edit config" },
      S = { function() vim.cmd.edit('/tmp/scratch.md') end, "Scratchpad" },
      m = {
        name = "Markdown",
        t = { "<cmd>ToggleCheckbox<cr>", "Toggle checkbox" }
      }
    }, { prefix = "<leader>" })
  end,
})
```

### Telescope

Search files, buffers, strings and much more.

```lua
table.insert(plugins, {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.2',
  dependencies = { 'nvim-lua/plenary.nvim', 'debugloop/telescope-undo.nvim' },
  config = function()
    local actions = require("telescope.actions")
    local trouble = require("trouble.providers.telescope")
    require('telescope').setup({
      extentions = { undo = {}, },
      defaults = {
        mappings = {
          i = { ["<c-t>"] = trouble.open_with_trouble },
          n = { ["<c-t>"] = trouble.open_with_trouble },
        }
      },
      pickers = {
        live_grep = {
          additional_args = function(opts)
            return { "--hidden" }
          end
        },
      },
    })
    require("telescope").load_extension("undo")
  end,
})
```

### Treesitter

Setup code hightlighting.

```lua
table.insert(plugins, {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      ensure_installed = { "rust", "lua", "vim", "vimdoc", "query", "haskell", "css", "javascript", "html", "typescript",
        "markdown", "bash" },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
})
```

### Conflicts

Show and operate on git conflicts.

```lua
table.insert(plugins, {
 'akinsho/git-conflict.nvim', version = "*", config = true
})
```

### Files

Work with a directory as a buffer

```lua
table.insert(plugins, {
  'stevearc/oil.nvim',
  opts = {},
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
})
```

### Terminal

Show and operate on git conflicts.

```lua
table.insert(plugins, {
  'akinsho/toggleterm.nvim',
  version = "*",
  opts = {--[[ things you want to change go here]]}
})
```

Setup keybindings for terminal mode

```lua
function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end
-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
```

Custom terminals

Now we can load the plugins.

```lua
require("lazy").setup(plugins)
vim.cmd[[colorscheme gruvbox]]
```

```lua
local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
local yarn = Terminal:new({ cmd = "yarn start", hidden = true, direction = "float" })

function _lazygit_toggle()
  lazygit:toggle()
end

function _yarn_toggle()
  yarn:toggle()
end
```
