-- Useful keymaps:
local vmap = vim.keymap
-- The most imporant keymap of all:
vim.g.mapleader = ' '

-- Harpoon:
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vmap.set("n", "<leader>a", mark.add_file, { desc = "Harpoon current file" })
vmap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = "Harpoon toggle menu" })
vmap.set("n", "<C-t>", function() ui.nav_file(1) end, { desc = "go to file 1" })
vmap.set("n", "<C-h>", function() ui.nav_file(2) end, { desc = "go to file 2" })
vmap.set("n", "<C-n>", function() ui.nav_file(3) end, { desc = "go to file 3" })
vmap.set("n", "<C-m>", function() ui.nav_file(4) end, { desc = "go to file 4" })

-- Telescope:
local builtin = require('telescope.builtin')

vmap.set('n', '<leader>ff', builtin.find_files, { desc = "Telescope find files" })

vmap.set('n', '<leader>fg', builtin.live_grep, { desc = "Telescope live grep" })

vmap.set('n', '<leader>g', builtin.git_files, { desc = "Telescope git files" })

vmap.set('n', '<leader>fb', builtin.buffers, { desc = "Telescope buffers" })

vmap.set('n', '<leader>fh', builtin.help_tags, { desc = "Telescope help tags" })

-- LSP:
-- see /after/plugin/lsp.lua
vmap.set("n", '<leader>for', ':LspZeroFormat<CR>', { desc = "LSP format file" })

-- Undotree:
vmap.set("n", '<leader>u', vim.cmd.UndotreeToggle, { desc = "Undotree Toggle" })

-- Better Term:
local betterTerm = require('betterTerm')
-- toggle better term
vmap.set({ "n", "t" }, "<leader>tt", betterTerm.open, { desc = "Toggle terminal" })

-- Code_Runner:
vmap.set('n', '<leader>rc', ':RunCode<CR>',
    { desc = "Run code", noremap = true, silent = false })
vmap.set('n', '<leader>rf', ':RunFile<CR>',
    { desc = "Run file", noremap = true, silent = false })
vmap.set('n', '<leader>rp', ':RunProject<CR>', { noremap = true, silent = false })
vmap.set('n', '<leader>rc', ':RunClose<CR>', { noremap = true, silent = false })

-- Nvim-Tree:
vmap.set('n', '<leader>pv', vim.cmd.NvimTreeToggle)

-- Trouble:
vmap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
    { silent = true, noremap = true })
vmap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
    { silent = true, noremap = true })
vmap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
    { silent = true, noremap = true })
vmap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
    { silent = true, noremap = true })
vmap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
    { silent = true, noremap = true })
vmap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",
    { silent = true, noremap = true })
-- nvim-dap

-- neo-test
local ntest = require('neotest').run
vmap.set('n', '<leader>ntt', function() ntest.run() end,
    { desc = 'Run the nearest test' })

vmap.set('n', '<leader>ntf', function() ntest.run(vim.fn.expand("%")) end,
    { desc = 'Run the tests in the file' })

vmap.set('n', '<leader>ntd', function() ntest.run({ strategy = "dap" }) end,
    { desc = 'Debug nearest test' })

vmap.set('n', '<leader>nts', function() ntest.stop() end,
    { desc = 'Stop the nearest' })

vmap.set('n', '<leader>nta', function() ntest.attach() end,
    { desc = 'Attach to the nearest test' })

vmap.set('n', '<leader>ntr',
    function() require("neotest").output_panel.toggle() end,
    { desc = 'Toggle tests output' })

vmap.set('n', '<leader>nto', function() require("neotest").summary.toggle() end,
    { desc = 'Toggle tests summary' })

-- Move selection up or down
vmap.set("v", "J", ":m '>+1<CR>gv=gv")
vmap.set("v", "K", ":m '<-2<CR>gv=gv")
-- Cursor stays in place during moving line
vmap.set("n", "J", "mzJ`z")
-- Cursor is centered during Ctrl+u/Ctrl+d
vmap.set("n", "<C-d>", "<C-d>zz")
vmap.set("n", "<C-u>", "<C-u>zz")
-- Searched for term stays in middle of screen during navigation)
vmap.set("n", "n", "nzzzv")
vmap.set("n", "N", "Nzzzv")
-- Copy the clipboard content into system clipboard
vmap.set({ "n", "v" }, "<leader>y", [["+y]],
    { desc = "Copy clipboard into system clipboard" })
vmap.set("n", "<leader>Y", [["+Y]],
    { desc = "Copy clipboard into system clipboard with overwrite" })
-- Modify the word under the cursor in the whole file
vmap.set("n", "<leader>s",
    [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "Modify word in whole file" })
-- Insert blank lines
vmap.set("n", "<leader>o", "o<Esc>k", { desc = "Whitespace under cursor" })
vmap.set("n", "<leader>O", 'O<Esc>j', { desc = "Whitespace above cursor" })
vmap.set("n", "<leader>cd", ":cd %:h<CR>", { desc = "Make file as working dir" })
