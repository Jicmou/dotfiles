-- Only display diagnostics for the current line
vim.diagnostic.config({ virtual_text = { current_line = true } })

-- enable lsp
vim.lsp.enable({ "bash_ls", "json_ls", "lua_ls", "ts_ls", "vue_ls" })
