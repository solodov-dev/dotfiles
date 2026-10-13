return {
  {
    "petertriho/nvim-scrollbar",
    event = "VeryLazy",
    opts = {
      hide_if_all_visible = true,
      handlers = {
        diagnostic = true,
        gitsigns = true,
      },
    },
  },
}
