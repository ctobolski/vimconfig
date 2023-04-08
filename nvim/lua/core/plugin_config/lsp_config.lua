require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "typescript" }
})


require('lspsaga').setup({
  code_action_icon = "💡",
  symbol_in_winbar = {
    in_custom = false,
    enable = true,
    separator = ' ',
    show_file = true,
    file_formatter = ""
  },
})

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local config = require("lspconfig")
local keymap = vim.keymap.set


keymap("n","gd", "<cmd>Lspsaga goto_definition<CR>")
keymap('n', 'K', '<Cmd>Lspsaga hover_doc<cr>', { silent = true })
keymap({"n","v"}, "<leader>a", "<cmd>Lspsaga code_action<CR>", { silent = true })
keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { silent = true })
keymap('n', 'gr', require('telescope.builtin').lsp_references, {})



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
