
return {{
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "nvim-telescope/telescope.nvim", -- optional
    "sindrets/diffview.nvim",        -- optional
  },
  config = true
},
{
  'akinsho/git-conflict.nvim', version = "*", config = true
}
}

