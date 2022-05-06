local opts = {noremap = true, silent = true}

local term_opts = {silent = true}
local keymap = vim.api.nvim_set_keymap

keymap("","<Space>","<Nop>",opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "s", ":w<CR>", opts)
keymap("n", "<leader>f",":Telescope find_files<CR>",opts)
keymap("n", "#", ":NvimTreeToggle<CR>", opts)
keymap("n", "<C-d>", ":bdelete<CR>",opts)
keymap("n", "H", ":BufferLineCyclePrev<CR>", opts)
keymap("n", "L", ":BufferLineCycleNext<CR>", opts)
keymap("n", "?", ":setlocal spell!<CR>", opts)
