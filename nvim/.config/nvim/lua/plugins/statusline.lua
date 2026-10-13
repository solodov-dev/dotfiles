return {
  {
    "nvim-lualine/lualine.nvim",
    name = "lualine",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "auto",
        globalstatus = true,
        disabled_filetypes = { statusline = { "dashboard", "alpha" } },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = {
          {
            "diagnostics",
            symbols = {
              error = " ",
              warn = " ",
              info = " ",
              hint = " ",
            },
          },
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          { "filename", path = 1, symbols = { modified = " ", readonly = "", newfile = "" } },
        },
        lualine_x = {
          {
            "diff",
            symbols = { added = " ", modified = " ", removed = " " },
          },
        },
        lualine_y = { "progress" },
        lualine_z = {
          "location",
          function()
            return os.date("%R")
          end,
        },
      },
      extensions = { "lazy", "oil", "quickfix", "nvim-tree", "trouble" },
    },
  },
}
