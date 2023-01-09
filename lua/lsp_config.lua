local lspconfig = require('lspconfig')

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

require('lspconfig')['clangd'].setup{
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = {
    textDocument = {
      completion = {
        completionItem = {
          snippetSupport=true
        }
      }
    }
  },
  init_options = {
    usePlaceholders = true,
    completeUnimported = true,
    clangdFileStatus = true
  }
}

require('lspconfig')['jdtls'].setup{
  on_attach=on_attach,
  flags = lsp_flags,
  init_options = {
    disableSnippets = false,
  },
  capabilities = {
    textDocument = {
      completion = {
        completionItem = {
          snippetSupport=true
        }
      }
    }
  },
}

require'lspconfig'.cmake.setup{}
require'lspconfig'.jsonls.setup{}
require'lspconfig'.luau_lsp.setup{}
require'lspconfig'.pyright.setup{}
require'lspconfig'.sumneko_lua.setup {}
