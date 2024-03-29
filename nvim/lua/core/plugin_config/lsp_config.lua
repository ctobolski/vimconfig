require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "tsserver", "graphql" }
})


local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
--vim ufo is in here to set the folding settings
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}
local config = require("lspconfig")
local keymap = vim.keymap.set


keymap("n", "<leader>e", function()
  require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
end)
keymap("n", "<leader>E", function()
  require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
end)
keymap("n","gd", "<cmd>Lspsaga goto_definition<CR>")
keymap('n', 'K', '<Cmd>Lspsaga hover_doc<cr>', { silent = true })
keymap({"n","v"}, "<leader>a", "<cmd>Lspsaga code_action<CR>", { silent = true })
keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { silent = true })



config.lua_ls.setup {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath "config" .. "/lua"] = true,
        },
      },
    },
  },
}

config.tsserver.setup {
  capabilities = capabilities,
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  settings = { },
}

config.jsonls.setup {
  capabilities = capabilities
}

config.eslint.setup {
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  capabilities = capabilities
}

config.graphql.setup {
  filetypes = { "graphql" },
  capabilities = capabilities
}

