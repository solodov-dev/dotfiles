return {
  {
    "petertriho/nvim-scrollbar",
    event = "VeryLazy",
    branch = "v1",
    opts = {
      hide_if_all_visible = true,
      handlers = {
        diagnostic = true,
        gitsigns = true,
      },
    },
  },
}
