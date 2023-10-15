local previewers = require("telescope.previewers")
local builtin = require("telescope.builtin")

local M = {}

M.git_bcommits = function()
  local opts = {}
  opts.previewer = previewers.new_termopen_previewer({
    get_command = function(entry)
      return {
        "git", "-c", "core.pager=delta", "-c", "delta.pager=less -R", "show", entry.value,
      }
    end,
  })

  builtin.git_bcommits({})
end


return M
