return {
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
      require("barbecue").setup({
        theme = "tokyonight-night",
      })
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.2",
    dependencies = { "nvim-lua/plenary.nvim", "debugloop/telescope-undo.nvim" },
    config = function()
      require("telescope").setup({
        extentions = { undo = {} },
        defaults = {
        },
        pickers = {
          find_files = {
            hidden = true,
          },
          live_grep = {
            additional_args = function()
              return { "--hidden" }
            end,
          },
        },
      })
      require("telescope").load_extension("undo")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    name = "lualine",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("lualine").setup({
        options = {
          -- ... your lualine config
          theme = "tokyonight",
          -- ... your lualine config
        },
      })
    end,
  },
}
