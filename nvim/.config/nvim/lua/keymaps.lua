-- Keymaps

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- move line down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- move line up
vim.keymap.set("n", "J", "mzJ`z") -- connect line without moving the coursor

function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
	vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
	vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
	vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {},
		config = function()
			require("which-key").add({
				{ "<leader>f", group = "File" },
				{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File (all)" },
				{ "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "Git Files" },
				{ "<leader>fr", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
				{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
				{ "<leader>fu", "<cmd>Telescope undo<cr>", desc = "Undo tree" },
				{ "<leader>fh", "<cmd>Telescope oldfiles<cr>", desc = "History" },
				{ "<leader>fo", "<cmd>Oil<cr>", desc = "Oil (edit files as buffer)" },
				{ "<leader>fe", vim.cmd.Ex, desc = "File explorer" },
				{ "<leader>g", group = "Git" },
				{ "<leader>gg", "<cmd>Neogit<cr>", desc = "Git" },
				{ "<leader>gb", "<cmd>BlameToggle<cr>", desc = "Blame" },
				{ "<leader>l", group = "LSP" },
				{ "<leader>lI", "<cmd>Mason<cr>", desc = "Install" },
				{ "<leader>ld", vim.lsp.buf.definition, desc = "Definiion" },
				{ "<leader>li", vim.lsp.buf.implementation, desc = "Implementation" },
				{ "<leader>lh", vim.lsp.buf.hover, desc = "Signature" },
				{ "<leader>la", vim.lsp.buf.code_action, desc = "Actions" },
				{ "<leader>lr", vim.lsp.buf.references, desc = "References" },
				{ "<leader>lR", vim.lsp.buf.rename, desc = "Rename" },
				{
					"<leader>lf",
					function()
						require("conform").format({ async = true, lsp_fallback = true })
					end,
					desc = "Format",
				},
				{ "<leader>d", group = "Diagnostics" },
				{ "<leader>dh", vim.diagnostic.open_float, desc = "Open highlighted" },
				{ "<leader>dn", vim.diagnostic.goto_next, desc = "Next" },
				{ "<leader>dp", vim.diagnostic.goto_prev, desc = "Previous" },
				{ "<leader>dw", "<cmd>Trouble workspace_diagnostics<cr>", desc = "Workspace" },
				{ "<leader>dd", "<cmd>Trouble document_diagnostics<cr>", desc = "Document" },
				{ "<leader>dq", "<cmd>Trouble quickfix<cr>", desc = "Quickfix" },
				{ "<leader>dl", "<cmd>Trouble loclist<cr>", desc = "Loclist" },
				{ "<leader>t", group = "Terminal" },
				{ "<leader>tt", "<cmd>ToggleTerm direction=float<cr>", desc = "Toggle" },
				{ "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "Vertical" },
				{ "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Horizontal" },
				{
					"<leader>v",
					function()
						vim.cmd.edit("~/.config/nvim/init.lua")
					end,
					desc = "Edit config",
				},
				{ "<leader>m", group = "Markdown" },
				{ "<leader>mt", "<cmd>MarkdownPreviewToggle<cr>", desc = "Toggle preview" },
				{ "<leader>b", group = "Debugger" },
				{ "<leader>bb", "<cmd>DapToggleBreakpoint<cr>", desc = "Add breakpoint" },
				{ "<leader>br", "<cmd>DapContinue<cr>", desc = "Start or continue debugger" },
			})
		end,
	},
}
