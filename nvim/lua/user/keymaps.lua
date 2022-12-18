local opts = {noremap = true, silent = true}

local term_opts = {silent = true}
local keymap = vim.api.nvim_set_keymap
keymap("","<Space>","<Nop>",opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "#", ":NvimTreeToggle<CR>", opts)
keymap("n", "s", ":w<CR>", opts)
keymap("n", "<leader>f",":Telescope find_files<CR>",opts)
keymap("n", "<C-r>", ":bdelete<CR>",opts)
keymap("n", "H", ":BufferLineCyclePrev<CR>", opts)
keymap("n", "L", ":BufferLineCycleNext<CR>", opts)
keymap("n", "?", ":setlocal spell!<CR>", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "<leader>u", ":UndotreeToggle <CR>", opts)
keymap("n", "<leader>gs", ":Git<CR>", opts)
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "<C-c>", ":nohls<CR>", opts)
keymap("n", "<leader>n",":NnnPicker<CR>",opts)
