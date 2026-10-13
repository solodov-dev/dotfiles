return {
  {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    opts = {
      progress = {
        display = {
          done_icon = "✔",
          done_ttl = 3,
          progress_icon = { "dots" },
        },
      },
      notification = {
        override_vim_notify = false,
      },
    },
  },
}
