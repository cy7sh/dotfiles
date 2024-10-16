local lsp = vim.lsp
local diagnostic = vim.diagnostic
local keymap = vim.keymap

keymap.set("n", "gd", lsp.buf.definition)
keymap.set("n", "<space>rn", lsp.buf.rename)
keymap.set("n", "gr", lsp.buf.references)
keymap.set("n", "[d", diagnostic.goto_prev)
keymap.set("n", "]d", diagnostic.goto_next)

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.gopls.setup {
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
    }
  },
  capabilities = capabilities,
}

lspconfig.pylsp.setup{ capabilities = capabilities }
lspconfig.clangd.setup{ capabilities = capabilities }
lspconfig.vimls.setup{ capabilities = capabilities }
lspconfig.bashls.setup{ capabilities = capabilities }
lspconfig.lua_ls.setup{ capabilities = capabilities }
