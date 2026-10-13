return {
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        diagnostics = "nvim_lsp",
        always_show_bufferline = false,
        offsets = {
          { filetype = "NvimTree", text = "File Explorer", text_align = "left", highlight = "Directory" },
          { filetype = "oil", text = "Oil", text_align = "left", highlight = "Directory" },
        },
      },
    },
  },
}
