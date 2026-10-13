do
  local options = {
    tabstop = 2,
    shiftwidth = 2,
    expandtab = true,
    softtabstop = 2,
    number = true,
    smartindent = true,
    hlsearch = true,
    incsearch = true,
    termguicolors = true,
    scrolloff = 8,
    signcolumn = "yes",
    updatetime = 50,
    colorcolumn = "80",
    clipboard = "unnamedplus",
    wrap = false,
    background = "light",
    cursorline = true,
    winborder = "rounded",
    fillchars = "eob: ,vert:│,fold:·,diff:╱",
    listchars = "tab:» ,trail:·,nbsp:␣,extends:›,precedes:‹",
    smoothscroll = true,
    pumheight = 12,
    splitright = true,
    splitbelow = true,
    laststatus = 3,
  }

  for option, value in pairs(options) do
    vim.o[option] = value
  end
end

return {}
