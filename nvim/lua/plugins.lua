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

local lazy = require("lazy")
local view_config = require("lazy.view.config")

local configuration = {
  install = {
    colorscheme = { "gruvbox" }
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip", "netrwPlugin", "rplugin", "tarPlugin", "tohtml", "tutor",
        "zipPlugin",
      },
    }
  },
  ui = {
    border = "single",
    icons = {
      cmd = "❯",
      config = "✹",
      event = "♢",
      ft = "*",
      init = "⏻",
      keys = "♫",
      plugin = "□",
      runtime = "○",
      source = "‹›",
      start = "▷",
      task = "✔ ",
      lazy = "⠤⠤ ",
      list = { "●", "→", "◉", "‒" },
    },
  },
}

view_config.keys.close = "<Esc>"
view_config.keys.profile_filter = "<C-p>"

--local plugins = {
--  --'https://github.com/nvim-lua/plenary.nvim',
--  --'christoomey/vim-tmux-navigator', -- enables switching between vim and tmux panes using the same keybindings <3
--  ----Toolbox
--  --"github/copilot.vim", -- a little help from our friend
--  ----Language Support
--  --"williamboman/mason.nvim", -- language server manager
--  --"williamboman/mason-lspconfig.nvim", -- glue between mason and nvim-lspconfig
--  --"neovim/nvim-lspconfig", -- simply sets up config for a language server, server must be installed by something like mason.nvim
--  --'hrsh7th/cmp-nvim-lsp', --provide improved completion for neovims lsp
--  --{
--  --  "nvimdev/lspsaga.nvim",
--  --  config = function() 
--  --    require('lspsaga').setup({
--  --      code_action_icon = "💡",
--  --      symbol_in_winbar = {
--  --        in_custom = false,
--  --        enable = true,
--  --        separator = ' ',
--  --        show_file = true,
--  --        file_formatter = ""
--  --      }
--  --    })
--  --  end
--  --},
--  --{
--  --  "ray-x/lsp_signature.nvim",
--  --  event = "VeryLazy",
--  --},
--  --"jose-elias-alvarez/null-ls.nvim",
--  --'lewis6991/gitsigns.nvim',
--  --'hrsh7th/nvim-cmp',
--  --'L3MON4D3/LuaSnip',
--  --'saadparwaiz1/cmp_luasnip',
--  --"rafamadriz/friendly-snippets",
--  --"MunifTanjim/prettier.nvim",
--  --{
--  --  "toppair/peek.nvim", -- preview code in popup window like markdown files
--  --  build = "deno task --quiet build:fast",
--  --},
--  --{
--  --  "ibhagwan/fzf-lua",
--  --  -- optional for icon support
--  --  dependencies = { "nvim-tree/nvim-web-devicons" },
--  --  config = function()
--  --    -- calling `setup` is optional for customization
--  --    require("fzf-lua").setup({})
--  --  end
--  --},
--  ---- {
--  ---- 'nvim-telescope/telescope.nvim',
--  ---- tag = '0.1.0',
--  ---- dependencies = { {'nvim-lua/plenary.nvim'} }
--  ---- },
--  --{
--  --  'kevinhwang91/nvim-ufo',
--  --  dependencies = { {'kevinhwang91/promise-async'} }
--  --}
--}

local plugins = {
  -----------------------------
  -- Colorscheme
  -----------------------------
  'ellisonleao/gruvbox.nvim',
  {   'bluz71/vim-nightfly-colors', lazy = true },
  -------------------------------
  ---- Appearance
  -------------------------------
  { 'bluz71/nvim-linefly' },
  {
    "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "BufReadPre",
  },
  -------------------------------
  ---- Behavior
  -------------------------------

  "rhysd/clever-f.vim", -- ~/dotfiles/nvim/after/plugin/clever-f.lua
  "wellle/targets.vim",
  {
    "tpope/vim-unimpaired",
    keys = { "[", "]" },
  },
  'tpope/vim-fugitive',
  'tpope/vim-surround',
  'tpope/vim-repeat',
  'tpope/vim-commentary',

  -------------------------------
  ---- Filesystem
  -------------------------------

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      {
        "s1n7ax/nvim-window-picker",
        version = "2.*",
      },
    },
    event = "VeryLazy",
  },

  -------------------------------
  ---- Fuzzy
  -------------------------------
  {
    "nvim-telescope/telescope.nvim",
    tag = '0.1.4',
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    keys = { "<Space>" },
  },
  -----------------------------
  -- Treesitter
  -----------------------------
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufReadPost",
  },
  -----------------------------
  -- Autocomplete
  -----------------------------
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "dcampos/cmp-snippy",
    },
    event = "InsertEnter",
  },
  {
    "dcampos/nvim-snippy",
    event = "InsertEnter",
    -- ~/dotfiles/nvim/snippets (custom snippets)
  },
  -----------------------------
  -- LSP / Development plugins
  -----------------------------
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
  },
  "williamboman/mason.nvim", -- language server manager
  "williamboman/mason-lspconfig.nvim", -- glue between mason and nvim-lspconfig
}


lazy.setup(plugins, configuration)
