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
  'ellisonleao/gruvbox.nvim',
  {
    'dracula/vim',
    lazy = false,
  },
  'nvim-lualine/lualine.nvim',
  'nvim-treesitter/nvim-treesitter',
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
  'christoomey/vim-tmux-navigator',
  --'bluz71/vim-nightfly-colors',
  --'vim-test/vim-test',
  --'lewis6991/gitsigns.nvim',
  'tpope/vim-fugitive',
  'tpope/vim-surround',
  -- completion
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',
  "rafamadriz/friendly-snippets",
  "neovim/nvim-lspconfig",
  "github/copilot.vim",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "glepnir/lspsaga.nvim",
  "jose-elias-alvarez/null-ls.nvim",
  "MunifTanjim/prettier.nvim",
  {
	  'nvim-telescope/telescope.nvim',
	  tag = '0.1.0',
	  dependencies = { {'nvim-lua/plenary.nvim'} }
  }
}

local opts = {}

require("lazy").setup(plugins, opts)
