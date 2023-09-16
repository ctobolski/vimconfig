require('telescope').setup {
  pickers = {
    find_files = {
      hidden = true
    },
    live_grep = {
      hidden = true
    }
  }
}

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<c-p>', builtin.find_files, {})
vim.keymap.set('n', '<Space><Space>', builtin.oldfiles, {})
vim.keymap.set('n', '<Space>fg', builtin.live_grep, {})
