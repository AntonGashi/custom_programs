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

--cmp set up
vim.opt.completeopt={"menu", "menuone", "noselect"}


  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        --vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<Tab>'] = cmp.mapping.select_next_item(),
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

