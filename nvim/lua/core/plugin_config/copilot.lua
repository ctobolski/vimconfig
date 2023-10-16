local map = vim.keymap.set

local function accept_word()
  vim.fn['copilot#Accept']("")
  local bar = vim.fn['copilot#TextQueuedForInsertion']()
  return vim.fn.split(bar, [[[ .]\zs]])[1]
end

local function accept_line()
  vim.fn['copilot#Accept']("")
  local bar = vim.fn['copilot#TextQueuedForInsertion']()
  return vim.fn.split(bar, [[[\n]\zs]])[1]
end

vim.g.copilot_no_tab_map = true

map('i', '<M-j>', '<Plug>(copilot-next)', {})
map('i', '<M-k>', '<Plug>(copilot-previous)', {})
map( "i", "<M-l>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

local opts = {expr = true, remap = false}
map('i', '<M-o>', accept_word, opts)
map('i', '<M-i>', accept_line, opts)
map("n", "<Leader>ce", ":Copilot enable<CR>", opts)
map("n", "<Leader>cd", ":Copilot disable<CR>", opts)


