local function theme_palette()
  local hl = vim.api.nvim_get_hl(0, { name = "Normal", link = true })
  local skip = hl.fg
  local groups = {
    "String",
    "Number",
    "Keyword",
    "Statement",
    "Type",
    "Identifier",
    "PreProc",
    "Special",
    "Constant",
    "Function",
  }
  local colors = {}
  local seen = {}
  for _, group in ipairs(groups) do
    local h = vim.api.nvim_get_hl(0, { name = group, link = true })
    if h.fg and h.fg ~= skip and not seen[h.fg] then
      seen[h.fg] = true
      colors[#colors + 1] = string.format("#%06x", h.fg)
    end
  end
  if #colors < 2 then
    return {
      "#9d0006",
      "#79740e",
      "#b57614",
      "#076678",
      "#8f3f71",
      "#427b58",
      "#af3a03",
    }
  end
  return colors
end

return {
  {
    "FabijanZulj/blame.nvim",
    config = function()
      require("blame").setup({ colors = theme_palette() })
    end,
  },
}
