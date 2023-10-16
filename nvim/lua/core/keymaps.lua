local keymap = vim.api.nvim_set_keymap
local map = vim.keymap.set
local default_opts = { noremap = true, silent = true}

vim.g.mapleader = " "

-- window switching
keymap("n", "<c-k>", ":wincmd k<CR>", default_opts)
keymap("n", "<c-j>", ":wincmd j<CR>", default_opts)
keymap("n", "<c-h>", ":wincmd h<CR>", default_opts)
keymap("n", "<c-l>", ":wincmd l<CR>", default_opts)

-- tab nav
map("n", "<Leader>j", ":tabprevious <CR>", default_opts)
keymap("n", "<Leader>k", ":tabnext <CR>", default_opts)

--quickly edit vimrc or source vimrc
keymap("n", "<Leader>rc", ":tabe $MYVIMRC<CR>", default_opts)
keymap("n", "<Leader>sc", ":source $MYVIMRC<CR>", default_opts)

-- clear search results on enter
keymap("n", "<CR>", "<CR> :noh<CR><CR>", default_opts)

-------------------------------
-- Completion mappings
-------------------------------
-- Map TAB and SHIFT-TAB to forward and backwards completion.
map("i", "<Tab>", require("core.util.complete").tab)
map("i", "<S-Tab>", require("core.util.complete").shift_tab)
--   ]     - 'tags' file completion
--   Space - context aware omni completion (via 'omnifunc' setting)
--   b     - keyword completion from the current buffer (<C-n><C-b> to extend)
--   d     - dictionary completion (via 'dictionary' setting)
--   f     - file path completion
--   l     - line completion (repeat an existing line)
map("i", "<C-]>", "<C-x><C-]>")
map("i", "<C-Space>", "<C-x><C-o>")
map("i", "<C-b>", "<C-x><C-p>")
map("i", "<C-d>", "<C-x><C-k>")
map("i", "<C-f>", "<C-x><C-f>")
map("i", "<C-l>", "<C-x><C-l>")
