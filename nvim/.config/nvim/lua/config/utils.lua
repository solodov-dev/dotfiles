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
	local bufname = vim.api.nvim_buf_get_name(0)
	local filepath

	-- Handle oil buffer: extract the directory path from oil:// URL
	if bufname:match("^oil://") then
		-- Remove oil:// prefix and trailing slash
		filepath = bufname:gsub("^oil://", ""):gsub("/+$", "")
	else
		filepath = bufname
	end

	-- Make path relative to project root
	local project_root = get_project_root()
	if filepath:find(project_root, 1, true) == 1 then
		filepath = filepath:sub(#project_root + 2) -- +2 to remove root path and separator
	end

	vim.fn.setreg("+", filepath)
	print("Relative path copied: " .. filepath)
end

return M
