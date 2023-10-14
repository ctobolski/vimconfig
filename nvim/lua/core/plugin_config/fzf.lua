-- vim.keymap.set('n', '<c-p>', builtin.find_files, {})
-- vim.keymap.set('n', '<Space><Space>', builtin.oldfiles, {})
local fzf = require('fzf-lua')
vim.keymap.set('n', '<c-p>', fzf.files, {})
vim.keymap.set('n', '<Space><Space>', fzf.buffers, {})
vim.keymap.set('n', '<Space>gs', fzf.git_status, {})
vim.keymap.set({ "n", "v", "i" }, "<C-x><C-f>",
  function() fzf.complete_path() end,
  { silent = true, desc = "Fuzzy complete path" })
vim.keymap.set('n', '<Space>fg', fzf.grep_cword, {})
vim.keymap.set('n', '<Space>Fg', fzf.grep_cWORD, {})
vim.keymap.set('n', '<Space>gr', fzf.lsp_references, {})
