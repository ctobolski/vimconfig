-- require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets" } })


local ls = require("luasnip")
local map = vim.keymap.set
-- local type = require("luasnip.util.types")
--
ls.config.set_config {
  updateevents = "TextChanged,TextChangedI",

}

map({ "i", "s" }, "<C-k>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

map({ "i", "s" }, "<C-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

map("i", "<C-e>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, { silent = true })

map("n", ",s", "<cmd>source ~/.config/nvim/lua/core/plugin_config/luasnip.lua<CR>")

ls.snippets = {
  all = {
    ls.parser.parse_snippet("expand", "--this is what was expanded!"),
  },
  lua = {}
}
