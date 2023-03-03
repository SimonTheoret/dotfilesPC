-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.bulitin_lsp = true
-- Lazy boostrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)
-- General options:
vim.opt.relativenumber = true
vim.opt.nu = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

vim.opt.scrolloff = 8
vim.opt.colorcolumn = "80"
vim.opt.updatetime = 50
vim.opt.termguicolors = true
vim.opt.textwidth = 79
vim.o.updatetime = 250
vim.o.completeopt = 'menuone,noselect'

vim.g.vimtex_view_general_viewer = "zathura"

-- Focus undotree when toggled
vim.g.undotree_SetFocusWhenToggle = 1

-- Installing required packages:
require('lazy').setup("plugins")
--Mappings:
require("simon.remap")
require("simon.lualine_config")

-- Use zathura as PDF viewer



























