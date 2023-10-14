local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  -- Appearance
  'nvim-lualine/lualine.nvim',
  --'bluz71/vim-nightfly-colors',
  'ellisonleao/gruvbox.nvim',
  {
    'dracula/vim',
    lazy = false,
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {}
    end,
  },
  'https://github.com/nvim-lua/plenary.nvim',
  'christoomey/vim-tmux-navigator', -- enables switching between vim and tmux panes using the same keybindings <3
  --Toolbox
  'tpope/vim-fugitive',
  'tpope/vim-surround',
  'tpope/vim-repeat',
  'tpope/vim-commentary',
  "github/copilot.vim", -- a little help from our friend
  --Language Support
  'nvim-treesitter/nvim-treesitter', -- parsers for syntax highlighting
  "williamboman/mason.nvim", -- language server manager
  "williamboman/mason-lspconfig.nvim", -- glue between mason and nvim-lspconfig
  "neovim/nvim-lspconfig", -- simply sets up config for a language server, server must be installed by something like mason.nvim
  'hrsh7th/cmp-nvim-lsp', --provide improved completion for neovims lsp
  {
    "nvimdev/lspsaga.nvim",
    config = function() 
      require('lspsaga').setup({
        code_action_icon = "💡",
        symbol_in_winbar = {
          in_custom = false,
          enable = true,
          separator = ' ',
          show_file = true,
          file_formatter = ""
        }
      })
    end
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
  },
  "jose-elias-alvarez/null-ls.nvim",
  'lewis6991/gitsigns.nvim',
  'hrsh7th/nvim-cmp',
  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',
  "rafamadriz/friendly-snippets",
  "MunifTanjim/prettier.nvim",
  {
    "toppair/peek.nvim", -- preview code in popup window like markdown files
    build = "deno task --quiet build:fast",
  },
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- calling `setup` is optional for customization
      require("fzf-lua").setup({})
    end
  },
  -- {
  -- 'nvim-telescope/telescope.nvim',
  -- tag = '0.1.0',
  -- dependencies = { {'nvim-lua/plenary.nvim'} }
  -- },
  {
    'kevinhwang91/nvim-ufo',
    dependencies = { {'kevinhwang91/promise-async'} }
  }
}

local opts = {}

require("lazy").setup(plugins, opts)
