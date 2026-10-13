local M = {}

--- Get the project root (git root or current directory)
local function get_project_root()
  local git_root = vim.fn.system("git rev-parse --show-toplevel 2>/dev/null"):gsub("\n", "")
  if vim.v.shell_error == 0 and git_root ~= "" then
    return git_root
  end
  return vim.fn.getcwd()
end

--- Copy file path relative to project root to clipboard
function M.copyFilepath()
  local filepath

  -- Handle oil buffer: extract the directory path from oil:// URL
  if vim.bo.filetype == "oil" then
    filepath = require("oil").get_current_dir()
  else
    filepath = vim.api.nvim_buf_get_name(0)
  end

  -- Make path relative to project root
  local project_root = get_project_root()
  if filepath:find(project_root, 1, true) == 1 then
    filepath = filepath:sub(#project_root + 2) -- +2 to remove root path and separator
  end

  -- Put into clipboard register
  vim.fn.setreg("+", filepath)
  print("Relative path copied: " .. filepath)
end

--- Open the message history in a new scratch buffer for copying
function M.openMessages()
  local msgs = vim.api.nvim_exec2("messages", { output = true }).output
  if msgs == "" then
    vim.notify("No messages", vim.log.levels.INFO)
    return
  end
  local lines = vim.split(msgs, "\n", { trimempty = true })
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  vim.api.nvim_open_win(buf, true, { split = "below", win = 0 })
  vim.bo[buf].filetype = "messages"
  vim.bo[buf].swapfile = false
  vim.bo[buf].bufhidden = "wipe"
  vim.keymap.set("n", "q", "<cmd>quit<cr>", { buffer = buf })
end

vim.api.nvim_create_user_command("Messages", M.openMessages, {
  desc = "Open message history in a scratch buffer",
})

return M
