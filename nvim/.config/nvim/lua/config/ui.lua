-- Global look-and-feel for Neovim's built-in diagnostics (LSP + vim.diagnostic).
-- Applied once at startup; everything here maps to :h vim.diagnostic.config().
--
--   virtual_text : render each diagnostic inline as virtual text at the end of
--                  the offending line. `spacing` = gap before it, `prefix` = the
--                  marker (here a dot), `source` = show the LSP server name when
--                  a line has diagnostics from more than one source.
--   signs        : what glyph goes in the sign column (gutter) per severity.
--                  A single bullet for every severity keeps it minimal; the
--                  gutter still gets the DiagnosticSign* colors.
--   underline    : underline the exact diagnostic range in the buffer.
--   update_in_insert : false -> skip refreshing display while typing in insert
--                  mode (perf win; still updates on CursorHold/idle).
--   severity_sort: order columns/listings by severity (error first).
--   float        : options for vim.diagnostic.open_float() (<leader>dh):
--                  rounded border, show source line, no header/prefix text.
vim.diagnostic.config({
  virtual_text = {
    spacing = 2,
    prefix = "●",
    source = "if_many",
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "●",
      [vim.diagnostic.severity.WARN] = "●",
      [vim.diagnostic.severity.INFO] = "●",
      [vim.diagnostic.severity.HINT] = "●",
    },
  },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = true,
    header = "",
    prefix = "",
  },
})

-- Make gitsigns' inline "current line blame" inherit the colorscheme's
-- comment color instead of a hardcoded color.
--
-- Why an autocmd? The `ColorScheme` event fires whenever a colorscheme is
-- applied or reloaded (startup AND runtime `:colorscheme` switches), so the
-- blame color always matches the active theme, not just the one we booted with.
--
-- What each line does:
--   * nvim_get_hl(..., { name = "Comment", link = true }): reads the resolved
--     Comment highlight. `link = true` follows the link chain and returns the
--     effective fg/bg rather than just a `link = "SomeOther"` reference.
--   * nvim_set_hl(0, "GitSignsCurrentLineBlame", { fg = comment.fg }): repaints
--     the highlight gitsigns applies to its inline blame virtual text
--     (<author> <time> - <summary>, toggled via <leader>gt).
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    local comment = vim.api.nvim_get_hl(0, { name = "Comment", link = true })
    vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", { fg = comment.fg })
  end,
})

return {}
