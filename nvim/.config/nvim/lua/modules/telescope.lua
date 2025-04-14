return {
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  { 'nvim-telescope/telescope-ui-select.nvim' },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "debugloop/telescope-undo.nvim" },
    config = function()
      require("telescope").setup({
        extentions = {
          undo = {},
          fzf = {
            override_generic_sorter = true,
            override_file_sorter = true,
          }
        },
        defaults = require('telescope.themes').get_ivy(),
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
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("ui-select")
    end,
  },
}
