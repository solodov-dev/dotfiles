return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      local wk = require("which-key")
      local utils = require("config.utils")
      return wk.add({
        { "<leader>s", group = "Search" },
        { "<leader>sf", "<cmd>Telescope find_files<cr>", desc = "Find Files (all)" },
        { "<leader>sR", "<cmd>Telescope resume<cr>", desc = "Resume previous search" },
        { "<leader>st", "<cmd>Telescope lsp_type_definitions<cr>", desc = "Type definitions" },
        { "<leader>si", "<cmd>Telescope lsp_implementations<cr>", desc = "Implementations" },
        { "<leader>sg", "<cmd>Telescope git_files<cr>", desc = "Git Files" },
        { "<leader>ss", "<cmd>Telescope live_grep<cr>", desc = "String" },
        { "<leader>sw", "<cmd>Telescope grep_string<cr>", desc = "Current Word" },
        { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Marks" },
        { "<leader>sb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
        { "<leader>su", "<cmd>Telescope undo<cr>", desc = "Undo" },
        { "<leader>so", "<cmd>Telescope oldfiles<cr>", desc = "Oldfiles" },
        { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help" },
        { "<leader>sj", "<cmd>Telescope jumplist<cr>", desc = "Jumplist" },
        { "<leader>sc", "<cmd>Telescope conflicts<cr>", desc = "Conflicts" },
        { "<leader>f", group = "Files" },
        { "<leader>fo", "<cmd>Oil<cr>", desc = "Oil" },
        { "<leader>ft", "<cmd>NvimTreeFindFileToggle<cr>", desc = "Tree" },
        { "<leader>b", group = "Buffers" },
        { "<leader>bP", "<cmd>BufferLinePick<cr>", desc = "Pick" },
        { "<leader>bd", "<cmd>bdelete<cr>", desc = "Delete" },
        { "<leader>bn", "<cmd>BufferLineCycleNext<cr>", desc = "Next" },
        { "<leader>bp", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous" },
        { "<leader>bC", "<cmd>BufferLineCloseOthers<cr>", desc = "Close others" },
        { "<leader>t", group = "Tasks" },
        { "<leader>tt", "<cmd>OverseerToggle<cr>", desc = "Toggle tasks list" },
        { "<leader>tr", "<cmd>OverseerRun<cr>", desc = "Run task" },
        { "<leader>ti", "<cmd>OverseerInfo<cr>", desc = "Info" },
        { "<leader>g", group = "Git" },
        { "<leader>gg", "<cmd>Neogit<cr>", desc = "Git" },
        { "<leader>gb", "<cmd>BlameToggle<cr>", desc = "Blame" },
        { "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Status" },
        {
          "<leader>gh",
          function()
            require("gitsigns").preview_hunk()
          end,
          desc = "Preview hunk",
        },
        {
          "<leader>gr",
          function()
            require("gitsigns").reset_hunk()
          end,
          desc = "Reset hunk",
        },
        {
          "<leader>gS",
          function()
            require("gitsigns").stage_hunk()
          end,
          desc = "Stage hunk",
        },
        {
          "<leader>gu",
          function()
            require("gitsigns").undo_stage_hunk()
          end,
          desc = "Undo Stage hunk",
        },
        {
          "<leader>gp",
          function()
            require("gitsigns").preview_hunk_inline()
          end,
          desc = "Preview hunk inline",
        },
        {
          "<leader>gt",
          function()
            require("gitsigns").toggle_current_line_blame()
          end,
          desc = "Toggle Line Blame",
        },
        { "<leader>gd", desc = "Diff" },
        { "<leader>gdd", "<cmd>DiffviewOpen<cr>", desc = "Diff with current Index" },
        { "<leader>gdh", "<cmd>DiffviewFileHistory %<cr>", desc = "Diff file history" },
        { "<leader>gdc", "<cmd>DiffviewClose<cr>", desc = "Close Diffview" },
        { "<leader>c", group = "Quickfix list" },
        { "<leader>co", "<cmd>copen<cr>", desc = "Open" },
        { "<leader>cc", "<cmd>cclose<cr>", desc = "Close" },
        { "<leader>cn", "<cmd>cnext<cr>", desc = "Next" },
        { "<leader>cp", "<cmd>cprev<cr>", desc = "Prev" },
        { "<leader>l", group = "LSP" },
        { "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "Definiion" },
        { "<leader>li", "<cmd>lua vim.lsp.buf.implementation()<cr>", desc = "Implementation" },
        { "<leader>lh", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "Signature" },
        { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Actions" },
        { "<leader>lr", "<cmd>lua vim.lsp.buf.references()<cr>", desc = "References" },
        { "<leader>lR", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
        {
          "<leader>lf",
          "<cmd>lua require('conform').format({ async = true, lsp_fallback = true })<cr>",
          desc = "Format",
        },
        { "<leader>d", group = "Diagnostics" },
        { "<leader>dh", "<cmd>lua vim.diagnostic.open_float()<cr>", desc = "Open highlighted" },
        { "<leader>dn", "<cmd>lua vim.diagnostic.jump({ count = 1 })<cr>", desc = "Next" },
        { "<leader>dp", "<cmd>lua vim.diagnostic.jump({ count = -1 })<cr>", desc = "Previous" },
        { "<leader>n", group = "Notifications" },
        { "<leader>.", "<cmd>e ~/.config/nvim<cr>", desc = "Edit config" },
        { "<leader>u", group = "Utils" },
        {
          "<leader>uc",
          utils.copyFilepath,
          desc = "Copy filepath to clipboard",
        },
        { "<leader>us", "<cmd>ISwapWith<cr>", desc = "Swap arguments" },
      })
    end,
  },
}
