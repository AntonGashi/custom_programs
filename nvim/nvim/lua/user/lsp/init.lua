local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require'lspconfig'.texlab.setup{}
require'lspconfig'.pyright.setup{}
require "user.lsp.lsp-installer"
require("user.lsp.handlers").setup()
require "user.lsp.null-ls"
