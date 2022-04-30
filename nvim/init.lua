require "user.options"
require "user.plugins"
require "user.colorscheme"
require "user.autopairs"
require "user.lsp_cmp"
require "user.keymaps"
require"nvim-treesitter.configs".setup{
  ensure_installed = {"go","python","latex","markdown","bash"},
  highlight = {
    enable = true,
  },
}
require("bufferline").setup{}
