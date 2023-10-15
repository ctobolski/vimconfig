local treesitter = require("nvim-treesitter.configs")
local buffer = require("core.util.buffer")

treesitter.setup({
  -- No need to ensure_installed the following parsers.
  --
  -- Neovim 0.9 ships: c, lua, vim & vimdoc parsers
  -- Neovim 0.10 ships: bash, c, lua, markdown, markdown_inline, python, vim &
  --                    vimdoc parsers
  --
  ensure_installed = { 
    "lua", "bash", "css", "go", "html", 
    "java", "javascript", "markdown", "markdown_inline", "python",
    "regex", "tsx", "typescript"
  },

  highlight = {
    enable = true,
    disable = function(_, buf)
      if buffer.is_large(buf) then
        return true
      end
    end,
  },
  incremental_selection = {
    enable = false,
  },
  indent = {
    enable = true,
    disable = function(lang, buf)
      if lang == "html" or lang == "ruby" or lang == "rust" or buffer.is_large(buf) then
        -- Disable indent for certain filetypes & large files.
        return true
      end
    end,
  }
})
