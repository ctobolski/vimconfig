-- Do not load up plugin when in diff mode.
if vim.opt.diff:get() then
  return
end

local cmp = require("cmp")

cmp.setup({
  formatting = {
    format = function(entry, item)
      item.menu = ({
        nvim_lsp = "[L]",
        vsnip = "[S]",
        buffer = "[B]",
      })[entry.source.name]
      return item
    end,
  },
  mapping = {
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { "i" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { "i" }),
    ["<C-Space>"] = cmp.mapping.complete(),
  },
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  sources = {
    { name = "luasnip", keyword_length = 3, max_item_count = 5 },
    {
      name = "nvim_lsp",
      keyword_length = 3,
      max_item_count = 15,
      -- To list the trigger characters for the current LSP:
      --   lua print(vim.inspect(vim.lsp.buf_get_clients()[1].server_capabilities.completionProvider.triggerCharacters))
      trigger_characters = { ".", "@", ":", "/", "'", "(", "{" },
    },
    { name = "buffer", keyword_length = 4, max_item_count = 10 },
  },
  window = {
    completion = cmp.config.window.bordered({
      winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel",
    }),
    -- documentation = false,
  },
})
