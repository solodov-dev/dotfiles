-- [nfnl] Compiled from fnl/config/autocommands.fnl by https://github.com/Olical/nfnl, do not edit.
return vim.api.nvim_create_autocmd("BufWritePre", {pattern = {"*.tsx", "*.ts", "*.jsx", "*.js"}, command = "silent! EslintFixAll", group = vim.api.nvim_create_augroup("solo-js-format", {})})
