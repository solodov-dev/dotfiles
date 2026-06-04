-- Move to first non-blank character of the line
vim.keymap.set({ "n", "x", "o" }, "H", "^")
-- Move to the end of the line
vim.keymap.set({ "n", "x", "o" }, "L", "$")
