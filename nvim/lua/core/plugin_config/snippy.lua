local snippy = require("snippy")

snippy.setup({
  mappings = {
    i = {
      ["<C-j>"] = "expand_or_advance",
      ["<C-k>"] = "previous",
    },
  },
})

-- Insert mode snippy completion mapping - '<Control-s>'
-- TODO how to use visual mode snippet surround with snippy / cmp
vim.keymap.set("i", "<C-s>", function()
  require('snippy').complete()
end, { silent = true })
