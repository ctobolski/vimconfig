-- Do not load up plugin when in diff mode.
if vim.opt.diff:get() then
  return
end

local conform = require("conform")
local map = vim.keymap.set

--npm install -g @fsouza/prettierd
local prettier = { "prettierd", "prettier" }

conform.setup({
  formatters_by_ft = {
    css = prettier,
    html = prettier,
    javascript = prettier,
    json = prettier,
    jsonc = prettier,
    typescript = prettier,
    yaml = prettier,
  },
})

map("n", "'f", function()
  conform.format({ async = true, lsp_fallback = true, timeout_ms = 8000 })
end, { silent = true })
