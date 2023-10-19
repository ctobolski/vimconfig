local map = vim.keymap.set

vim.g.mapleader = " "

-- window switching
map("n", "<c-k>", ":wincmd k<CR>")
map("n", "<c-j>", ":wincmd j<CR>")
map("n", "<c-h>", ":wincmd h<CR>")
map("n", "<c-l>", ":wincmd l<CR>")

-- tab nav
map("n", "<Leader>j", ":tabprevious <CR>")
map("n", "<Leader>k", ":tabnext <CR>")

--quickly edit vimrc or source vimrc
map("n", "<Leader>rc", ":tabe $MYVIMRC<CR>")
map("n", "<Leader>sc", ":source $MYVIMRC<CR>")

-- clear search results on enter
map("n", "<CR>", "<CR> :noh<CR><CR>")

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
