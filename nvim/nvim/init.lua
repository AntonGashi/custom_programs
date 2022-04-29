require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.colorscheme"
require "user.cmp"
require "user.lsp"
require "user.telescope"
require "user.treesitter"
require "user.autopairs"
require "user.comment"
require "user.gitsigns"
require "user.nvim-tree"
require "user.bufferline"
require "user.lualine"
require "user.toggleterm"
require "user.project"
require "user.impatient"
require "user.indentline"
--require "user.alpha"
require "user.autocommands"
require'lspconfig'.pyright.setup{}
require'lspconfig'.texlab.setup{}
require'lspconfig'.remark_ls.setup{}
vim.opt.termguicolors = true
vim.cmd("colorscheme tender")
require'lspconfig'.gopls.setup{"gopls"}
vim.wo.number = true 
vim.wo.relativenumber = true