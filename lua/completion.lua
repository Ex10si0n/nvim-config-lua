local cmp = require('cmp')
local luasnip = require('luasnip')
local lsp = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspkind = require('lspkind')
local signature = require('lsp_signature')

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local signature_config = {
  hint_prefix = " ",
  floating_window = false,
}

local cmp_config = {
  snippet = {
    expand = function(args) require('luasnip').lsp_expand(args.body) end,
  },
  window = {
    completion = cmp.config.window.bordered({
      winhighlight = "Normal:None,FloatBorder:None,CursorLine:Todo,Search:None",
    }),
    documentation = cmp.config.window.bordered(),
  },
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol',
      maxwidth = 50,
      symbol_map = { Copilot = "" },
    })
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'copilot' },
    { name = 'luasnip' },
    { name = 'path' },
  }, {
    { name = 'buffer' },
  }),
}

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' },
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
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

-- Copilot configurations
cmp.event:on('menu_opened', function()
  vim.b.copilot_suggestion_hidden = true
end)

cmp.event:on('menu_closed', function()
  vim.b.copilot_suggestion_hidden = false
end)

-- Set up lspconfig by languages
lsp['lua_ls'].setup {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      }
    }
  },
}

lsp['jedi_language_server'].setup {
  capabilities = capabilities,
}

lsp['rust_analyzer'].setup {
  capabilities = capabilities,
}

lsp['typst_lsp'].setup {
  capabilities = capabilities,
  settings = {
    filetypes = { 'typst', 'typ' }
  }
}

signature.setup(signature_config)
cmp.setup(cmp_config)
