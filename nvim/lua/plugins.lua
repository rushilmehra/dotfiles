local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  use "wbthomason/packer.nvim" -- Have packer manage itself

  -- Colorschemes
  use 'gruvbox-community/gruvbox'
  use 'sainnhe/gruvbox-material'
  use 'rebelot/kanagawa.nvim'
  use 'folke/tokyonight.nvim'
  use "savq/melange-nvim"

  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

  use 'nvim-telescope/telescope.nvim'
  use 'tpope/vim-fugitive'
  use 'lewis6991/gitsigns.nvim'
  use 'tpope/vim-sleuth'
  use 'ggandor/lightspeed.nvim'
  use 'kyazdani42/nvim-tree.lua'
  use 'windwp/nvim-autopairs' -- pair characters ( [], {}, etc)
  use 'leafOfTree/vim-matchtag' -- highlights matching character
  use 'tpope/vim-commentary'
  use 'nvim-lualine/lualine.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use { 'nvim-treesitter/nvim-treesitter', run = ":TSUpdate" }
  use 'goolord/alpha-nvim'
  use 'lewis6991/impatient.nvim'

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "hrsh7th/cmp-nvim-lsp" -- LSP completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig"
  use "jose-elias-alvarez/nvim-lsp-ts-utils"
  use "akinsho/flutter-tools.nvim"
  use "ludovicchabant/vim-gutentags"

  -- Formatting
  use "jose-elias-alvarez/null-ls.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
