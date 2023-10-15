local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true}

vim.g.mapleader = " "

-- window switching
keymap("n", "<c-k>", ":wincmd k<CR>", default_opts)
keymap("n", "<c-j>", ":wincmd j<CR>", default_opts)
keymap("n", "<c-h>", ":wincmd h<CR>", default_opts)
keymap("n", "<c-l>", ":wincmd l<CR>", default_opts)

-- tab nav
keymap("n", "<Leader>j", ":tabprevious <CR>", default_opts)
keymap("n", "<Leader>k", ":tabnext <CR>", default_opts)

--quickly edit vimrc or source vimrc
keymap("n", "<Leader>rc", ":tabe $MYVIMRC<CR>", default_opts)
keymap("n", "<Leader>sc", ":source $MYVIMRC<CR>", default_opts)

-- clear search results on enter
keymap("n", "<CR>", "<CR> :noh<CR><CR>", default_opts)
