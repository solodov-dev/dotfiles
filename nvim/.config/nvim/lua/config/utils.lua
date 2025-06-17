local M = {}

function M.copyFilepath()
	local filepath = vim.fn.expand("%")
	vim.fn.setreg("+", filepath) -- write to clipboard
	print("Filepath is copied to the system clipboard")
end

return M
