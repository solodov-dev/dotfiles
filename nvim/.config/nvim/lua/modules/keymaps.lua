-- Keymaps

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- move line down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- move line up
vim.keymap.set("n", "J", "mzJ`z") -- connect line without moving the coursor
vim.keymap.set("v", "<leader>x", ":lua<cr>") -- execute lua

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
				{ "<leader>f", group = "Find (Telescope)" },
				{ "<leader>ff", "<cmd>Telescope find_files theme=ivy<cr>", desc = "Find File (all)" },
				{ "<leader>fr", "<cmd>Telescope resume theme=ivy<cr>", desc = "Resume search" },
				{ "<leader>ft", "<cmd>Telescope lsp_type_definitions theme=ivy<cr>", desc = "Type definitions" },
				{ "<leader>fi", "<cmd>Telescope lsp_implementations theme=ivy<cr>", desc = "Implementations" },
				{ "<leader>fg", "<cmd>Telescope git_files theme=ivy<cr>", desc = "Git Files" },
				{ "<leader>fs", "<cmd>Telescope live_grep theme=ivy<cr>", desc = "String" },
				{ "<leader>fm", "<cmd>Telescope marks theme=ivy<cr>", desc = "Marks" },
				{ "<leader>fb", "<cmd>Telescope buffers theme=ivy<cr>", desc = "Buffers" },
				{ "<leader>fu", "<cmd>Telescope undo theme=ivy<cr>", desc = "Undo tree" },
				{ "<leader>fo", "<cmd>Telescope oldfiles theme=ivy<cr>", desc = "Oldfiles" },
				{ "<leader>fh", "<cmd>Telescope help_tags theme=ivy<cr>", desc = "Help tags" },
				{ "<leader>fj", "<cmd>Telescope jumplist theme=ivy<cr>", desc = "Jumplist" },
				{ "<leader>o", "<cmd>Oil<cr>", desc = "Oil" },
				{ "<leader>g", group = "Git" },
				{ "<leader>gg", "<cmd>Neogit<cr>", desc = "Git" },
				{ "<leader>gb", "<cmd>BlameToggle<cr>", desc = "Blame" },
				{ "<leader>gs", "<cmd>Telescope git_status theme=ivy<cr>", desc = "Status" },
				{ "<leader>c", group = "Quickfix list" },
				{ "<leader>co", "<cmd>copen<cr>", desc = "Open" },
				{ "<leader>cc", "<cmd>cclose<cr>", desc = "Close" },
				{ "<leader>co", "<cmd>copen<cr>", desc = "Open" },
				{ "<leader>cn", "<cmd>cnext<cr>", desc = "Next" },
				{ "<leader>cp", "<cmd>cprev<cr>", desc = "Previous" },
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
				{
					"<leader>v",
					function()
						vim.cmd.edit("~/.config/nvim")
					end,
					desc = "Edit config",
				},
				{ "<leader>b", group = "Debugger" },
				{ "<leader>bb", "<cmd>DapToggleBreakpoint<cr>", desc = "Add breakpoint" },
				{ "<leader>br", "<cmd>DapContinue<cr>", desc = "Start or continue debugger" },
			})
		end,
	},
}
