-- General options:
local set = vim.opt
set.relativenumber = true
set.nu = true
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.smarttab = true
set.expandtab = true
set.smartindent = true

set.swapfile = false
set.backup = false
set.undodir = os.getenv("HOME") .. "/.vim/undodir"
set.undofile = true

set.hlsearch = false
set.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

set.scrolloff = 8
set.colorcolumn = "80"
set.updatetime = 50

set.termguicolors = true
set.textwidth = 79
vim.diagnostic.config({virtual_text = true})
vim.o.updatetime = 250
vim.o.completeopt = 'menuone,noselect'
