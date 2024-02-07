vim.g.mapleader =  " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>rr", [[:RustRun<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>w", "<C-w>",{ noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>i", "<C-a>",{ noremap = false, silent = true })
