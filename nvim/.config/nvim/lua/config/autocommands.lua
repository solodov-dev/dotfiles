-- Show the cursor line only in the active window.
--
-- cursorline is enabled globally in config/options.lua. Without these
-- autocmds every window (splits, nvim-tree, quickfix, diffview, ...) would
-- paint a highlighted line, which looks noisy.
--
-- BufEnter covers Windows whose active buffer changes within the same window.
vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
  callback = function()
    vim.opt_local.cursorline = true
  end,
})

-- When leaving a window, clear its cursor line so the highlight follows focus.
vim.api.nvim_create_autocmd("WinLeave", {
  callback = function()
    vim.opt_local.cursorline = false
  end,
})

return {}
