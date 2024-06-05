
return {{
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
},

{
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
      theme = 'tokyonight-night',
    }
  end,
},
{
  'nvim-telescope/telescope.nvim',
  tag = '0.1.2',
  dependencies = { 'nvim-lua/plenary.nvim', 'debugloop/telescope-undo.nvim' },
  config = function()
    local actions = require("telescope.actions")
    local trouble = require("trouble.sources.telescope")
    require('telescope').setup({
      extentions = { undo = {}, },
      defaults = {
        mappings = {
          i = { ["<c-t>"] = trouble.open },
          n = { ["<c-t>"] = trouble.open },
        }
      },
      pickers = {
        find_files = {
          hidden = true
        },
        live_grep = {
          additional_args = function(opts)
            return { "--hidden" }
          end
        },
      },
    })
    require("telescope").load_extension("undo")
  end,
}



}

