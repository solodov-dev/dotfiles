
return {{
  'numToStr/Comment.nvim',
  opts = {
    -- add any options here
  },
  lazy = false,
},


{
  'nvim-lualine/lualine.nvim',
  name = "lualine",
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require("lualine").setup {
      options = {
        -- ... your lualine config
        theme = 'tokyonight'
        -- ... your lualine config
      }
    }
  end,
},
{
  "kylechui/nvim-surround",
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup({
      -- Configuration here, or leave empty to use defaults
    })
  end
}

}

