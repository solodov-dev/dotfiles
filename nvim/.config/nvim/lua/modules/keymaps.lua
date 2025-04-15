-- Keymaps

vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv") -- move line down
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv") -- move line up
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
				{ "<leader>s", group = "Search" },
				{
					"<leader>sf",
					"<cmd>Telescope find_files <cr>",
					desc = "Find File (all)",
				},
				{ "<leader>sr", "<cmd>GrugFar<cr>", desc = "Replace" },
				{ "<leader>sR", "<cmd>Telescope resume <cr>", desc = "Resume search" },
				{
					"<leader>st",
					"<cmd>Telescope lsp_type_definitions <cr>",
					desc = "Type definitions",
				},
				{
					"<leader>si",
					"<cmd>Telescope lsp_implementations <cr>",
					desc = "Implementations",
				},
				{ "<leader>sg", "<cmd>Telescope git_files <cr>", desc = "Git Files" },
				{ "<leader>ss", "<cmd>Telescope live_grep <cr>", desc = "String" },
				{ "<leader>sm", "<cmd>Telescope marks <cr>", desc = "Marks" },
				{ "<leader>sb", "<cmd>Telescope buffers <cr>", desc = "Buffers" },
				{ "<leader>su", "<cmd>Telescope undo <cr>", desc = "Undo tree" },
				{ "<leader>so", "<cmd>Telescope oldfiles <cr>", desc = "Oldfiles" },
				{ "<leader>sh", "<cmd>Telescope help_tags <cr>", desc = "Help tags" },
				{ "<leader>sj", "<cmd>Telescope jumplist <cr>", desc = "Jumplist" },
				{ "<leader>f", group = "Files" },
				{ "<leader>fo", require("oil").toggle_float, desc = "Oil" },
				{ "<leader>fe", "<cmd>NvimTreeFindFileToggle<cr>", desc = "Explorer" },
				{ "<leader>fd", require("dropbar.api").pick, desc = "Dropbar" },
				{ "<leader>t", group = "Tasks" },
				{
					"<leader>tt",
					"<cmd>OverseerToggle<cr>",
					desc = "Toggle tasks list",
				},
				{ "<leader>tr", "<cmd>OverseerRun<cr>", desc = "Run task" },
				{ "<leader>ti", "<cmd>OverseerInfo<cr>", desc = "Info" },
				{ "<leader>tb", "<cmd>OverseerBuild<cr>", desc = "Build" },
				{ "<leader>g", group = "Git" },
				{ "<leader>gg", "<cmd>Neogit<cr>", desc = "Git" },
				{ "<leader>gb", "<cmd>BlameToggle<cr>", desc = "Blame" },
				{ "<leader>gs", "<cmd>Telescope git_status <cr>", desc = "Status" },
				{ "<leader>c", group = "Quickfix list" },
				{
					"<leader>ct",
					"<cmd>Trouble qflist toggle<cr>",
					desc = "Quickfix List (Trouble)",
				},
				{ "<leader>co", "<cmd>copen<cr>", desc = "Open" },
				{ "<leader>cc", "<cmd>cclose<cr>", desc = "Close" },
				{ "<leader>co", "<cmd>copen<cr>", desc = "Open" },
				{ "<leader>cn", "<cmd>cnext<cr>", desc = "Next" },
				{ "<leader>cp", "<cmd>cprev<cr>", desc = "Previous" },
				{ "<leader>D", group = "Diff" },
				{ "<leader>Dd", "<cmd>DiffviewOpen<cr>", desc = "Diff with current Index" },
				{ "<leader>Dh", "<cmd>DiffviewFileHistory %<cr>", desc = "Diff file history" },
				{ "<leader>Dc", "<cmd>DiffviewClose<cr>", desc = "Close Diffview" },
				{ "<leader>l", group = "LSP" },
				{ "<leader>lI", "<cmd>Mason<cr>", desc = "Install" },
				{
					"<leader>ll",
					"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
					desc = "LSP definitions / references / ... (Trouble)",
				},
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
				{ "<leader>dt", "<cmd>Trouble diagnostics toggle<cr>", desc = "Trouble" },
				{ "<leader>dT", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Trouble (current file)" },
				{ "<leader>ds", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols" },
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
