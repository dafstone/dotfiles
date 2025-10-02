-- Basic LSP setup
local lspconfig = require('lspconfig')

-- Go language server (only if gopls is available)
if vim.fn.executable('gopls') == 1 then
  lspconfig.gopls.setup{
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
      },
    },
  }
end

-- Python language server (only if pylsp is available)
-- Install with: pip install python-lsp-server
if vim.fn.executable('pylsp') == 1 then
  lspconfig.pylsp.setup{}
end

-- require'navigator'.setup()

