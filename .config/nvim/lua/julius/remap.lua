vim.g.mapleader =  " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>rr", [[:RustRun<CR>]], { noremap = true, silent = true })
