-- Init lazy.nvim plugin manager.

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local function merge_plugins(...)
  local plugins = {}
  for _, tb in ipairs({ ... }) do
    for _, v in ipairs(tb) do
      table.insert(plugins, v)
    end
  end

  return plugins
end

local plugins = merge_plugins(
  require("files"),
  require("git"),
  require("keymaps"),
  require("lsp"),
  require("terminal"),
  require("text"),
  require("themes"),
  require("treesitter"),
  require("ui")
)

require("lazy").setup(plugins)
