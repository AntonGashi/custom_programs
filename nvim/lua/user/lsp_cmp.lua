--lsp set up

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
require"lspconfig".gopls.setup{
  capabilities=capabilities,
  on_attach = function()
    vim.keymap.set("n","<C-k>", vim.lsp.buf.hover, {buffer=0})
    vim.keymap.set("n","<C-f>", vim.lsp.buf.formatting, {buffer=0})
    vim.keymap.set("n","<C-n>", vim.diagnostic.goto_next, {buffer=0})
  end,
}
require"lspconfig".pyright.setup{
  capabilities=capabilities,
  on_attach = function()
    vim.keymap.set("n","<C-k>", vim.lsp.buf.hover, {buffer=0})
    vim.keymap.set("n","<C-f>", vim.lsp.buf.formatting, {buffer=0})
    vim.keymap.set("n","<C-n>", vim.diagnostic.goto_next, {buffer=0})
  end,
}
require"lspconfig".texlab.setup{
  capabilities=capabilities,
  on_attach = function()
    vim.keymap.set("n","<C-k>", vim.lsp.buf.hover, {buffer=0})
    vim.keymap.set("n","<C-f>", vim.lsp.buf.formatting, {buffer=0})
    vim.keymap.set("n","<C-n>", vim.diagnostic.goto_next, {buffer=0})
  end,
}
require"lspconfig".remark_ls.setup{
  capabilities=capabilities,
  on_attach = function()
    vim.keymap.set("n","<C-k>", vim.lsp.buf.hover, {buffer=0})
    vim.keymap.set("n","<C-f>", vim.lsp.buf.formatting, {buffer=0})
    vim.keymap.set("n","<C-n>", vim.diagnostic.goto_next, {buffer=0})
  end,
}

vim.diagnostic.config({
  virtual_text = false
})

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
