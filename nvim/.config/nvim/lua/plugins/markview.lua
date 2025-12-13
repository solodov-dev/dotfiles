return {
  "OXY2DEV/markview.nvim",
  lazy = false,
  config = function()
    local markview = require("markview")
    markview.setup({
      preview = { enable = false }
    })
  end
}
