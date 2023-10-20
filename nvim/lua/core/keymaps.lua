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

vim.api.nvim_create_user_command("Cppath", function()
    local path = vim.fn.expand("%:p")
    vim.fn.setreg("p", path)
    vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

map("n", "<Leader>cp", ":Cppath<CR>")

-------------------------------
-- Completion mappings
-------------------------------
-- Map TAB and SHIFT-TAB to forward and backwards completion.
-- map("i", "<Down>", require("core.util.complete").tab)
-- map("i", "<Up>", require("core.util.complete").shift_tab)
--   b     - keyword completion from the current buffer (<C-n><C-b> to extend)
--   f     - file path completion
map("i", "<C-b>", "<C-x><C-p>")
map("i", "<C-f>", "<C-x><C-f>")
