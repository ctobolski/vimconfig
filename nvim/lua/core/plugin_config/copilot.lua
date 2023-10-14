local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true}

keymap("n", "<Leader>ce", ":Copilot enable<CR>", default_opts)
keymap("n", "<Leader>cd", ":Copilot disable<CR>", default_opts)
