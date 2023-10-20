require("mason").setup()
require("mason-lspconfig").setup({
  -- ensure_installed = { "graphql", "gopls", "lua_ls", "tsserver", }
  ensure_installed = {"eslint", "lua_ls", "tsserver"}
})


local cmd = vim.cmd
local lsp = vim.lsp
local map = vim.keymap.set
local opt_local = vim.opt_local

-- Do not load up plugin when in diff mode.
if vim.opt.diff:get() then
  cmd([[LspStop]])
  return
end

local nvim_lsp = require("lspconfig")
local nvim_lsp_windows = require("lspconfig.ui.windows")
local buffer = require("core.util.buffer")
local handlers = require("core.util.lsp-handlers")
local lsp_capabilities = require("core.util.lsp-capabilities")

-- Custom on attach function.
local lsp_on_attach = function(client)
  -- Disable LSP for files larger than 100KB.
  if buffer.is_large(0) then
    print("(LSP) DISABLED, file too large")
    cmd([[LspStop]])
    return
  end

  -- Mappings.
  -- local map = vim.keymap.set
  local opts = { buffer = true }
  map("n", "ga", lsp.buf.code_action, opts)
  map("n", "gd", lsp.buf.definition, opts)
  map("n", "gD", lsp.buf.declaration, opts)
  map("n", "gi", lsp.buf.implementation, opts)
  map("n", "K", lsp.buf.hover, opts)
  map("n", "gr", lsp.buf.references, opts)
  map("n", "gR", lsp.buf.rename, opts)

  -- Fuzzy mappings using Telescope.
  map("n", "<leader>lr", require("telescope.builtin").lsp_references)
  map("n", "<leader>lw", require("telescope.builtin").lsp_document_symbols)
  map("n", "<leader>lW", function()
    require("telescope.builtin").lsp_workspace_symbols({
      query = vim.fn.input("LSP Workspace Symbols❯ "),
    })
  end)
  -- Note, LSP formatting will be handled by the conform.nvim plugin.

  -- Disable Neovim LSP-set 'omnifunc' and 'formatexpr' options; these options
  -- cause problems with my custom-completion mapping along with the 'gq'
  -- command.
  opt_local.omnifunc = ""
  opt_local.formatexpr = ""
end

-- Global mappings.
map("n", "'r", ":LspRestart<CR>", { silent = true })

-- Add border to LSP windows such as `:LspInfo`.
nvim_lsp_windows.default_options.border = "single"

-- Custom on attach function which disables formatting where ALE will instead
-- be used to format.
local lsp_on_attach_no_formatting = function(client)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false

  lsp_on_attach(client)
end

-- Custom on attach function which disable LSP semantic highlighting.
-- local lsp_on_attach_no_semantic_highlights = function(client)
--   client.server_capabilities.semanticTokensProvider = nil
-- end

-- Global handlers.
lsp.handlers["textDocument/hover"] = handlers.hover
lsp.handlers["textDocument/signatureHelp"] = handlers.signature_help

-- The nvim-cmp completion plugin supports most LSP capabilities; we should
-- notify the language servers about that.
local capabilities = lsp_capabilities.default_capabilities()

--------------------------
-- The Language Servers 
--------------------------


local flags = { debounce_text_changes = 300 }

nvim_lsp.lua_ls.setup {
  on_attach = lsp_on_attach,
  capabilities = capabilities,
  flags = flags,
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


-- MasonInstall eslint_d
nvim_lsp.eslint.setup({
  on_attach = lsp_on_attach_no_formatting,
  capabilities = capabilities,
  filetypes = { "javascript", "typescript" },
  flags = { debounce_text_changes = 300 },
})

nvim_lsp.tsserver.setup({
  on_attach = lsp_on_attach_no_formatting,
  capabilities = capabilities,
  flags = flags,
  root_dir = nvim_lsp.util.root_pattern("package.json"),
})
