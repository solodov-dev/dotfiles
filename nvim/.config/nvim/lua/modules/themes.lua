return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme tokyonight-night")
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    -- config = function()
    --   vim.cmd("colorscheme gruvbox")
    -- end,
  },
  {
    "neanias/everforest-nvim",
    priority = 1000,
    -- config = function()
    -- 	vim.cmd("colorscheme everforest")
    -- end,
  },
}
