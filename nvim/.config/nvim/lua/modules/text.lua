return {
  { "numToStr/Comment.nvim" },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup({})
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
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
    -- use opts = {} for passing setup options
    -- this is equalent to setup({}) function
  },
  {
    "gpanders/nvim-parinfer",
  },
  {
    'jinh0/eyeliner.nvim',
    config = function()
      require('eyeliner').setup({
        highlight_on_key = true,
        dim = true,
      })
    end
  }
}
