-- Useful keymaps:
local vmap = vim.keymap
-- The most important keymap of all:
vim.g.mapleader = ' '

-- Vim-fugitive:

-- Tree-Sitter:
vmap.set("n", '<leader>u', vim.cmd.UndotreeToggle)

-- Harpoon:
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vmap.set("n", "<leader>a", mark.add_file)
vmap.set("n", "<C-e>", ui.toggle_quick_menu)

-- Telescope:
local builtin = require('telescope.builtin')
vmap.set('n', '<leader>ff', builtin.find_files, {})
vmap.set('n', '<leader>fg', builtin.live_grep, {})
vmap.set('n', '<leader>g', builtin.git_files, {})
vmap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") } );
end)

-- LSP:
-- see /after/plugin/lsp.lua

-- Undotree:
vmap.set("n", '<leader>u', vim.cmd.UndotreeToggle)

-- Better Term:
local betterTerm = require('betterTerm')
-- toggle firts term
vmap.set({"n", "t"}, "<leader>tt", betterTerm.open, { desc = "Open terminal"})

--Code Runner:
vmap.set('n', '<leader>rc', ':RunCode<CR>', { noremap = true, silent = false })
vmap.set('n', '<leader>rf', ':RunFile<CR>', { noremap = true, silent = false })
vmap.set('n', '<leader>rft', ':RunFile tab<CR>', { noremap = true, silent = false })
vmap.set('n', '<leader>rp', ':RunProject<CR>', { noremap = true, silent = false })
vmap.set('n', '<leader>rc', ':RunClose<CR>', { noremap = true, silent = false })
vmap.set('n', '<leader>crf', ':CRFiletype<CR>', { noremap = true, silent = false })
vmap.set('n', '<leader>crp', ':CRProjects<CR>', { noremap = true, silent = false })

-- ChadTree:
vmap.set('n', '<leader>pv', vim.cmd.CHADopen)

-- Trouble:
vmap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
    {silent = true, noremap = true}
)
vmap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
    {silent = true, noremap = true}
)
vmap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
    {silent = true, noremap = true}
)
vmap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
    {silent = true, noremap = true}
)
vmap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
    {silent = true, noremap = true}
)
vmap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",
    {silent = true, noremap = true}
)

-- New keymaps:
-- Move selection up or down
vmap.set("v", "J", ":m '>+1<CR>gv=gv")
vmap.set("v", "K", ":m '<-2<CR>gv=gv")
-- Cursor stays in place during moving line
vmap.set("n", "J", "mzJ`z")
-- Cursor is centured during Ctrl+u/Ctrl+d
vmap.set("n", "<C-d>", "<C-d>zz")
vmap.set("n", "<C-u>", "<C-u>zz")
-- Searched for term stays in middle of screen during navigation)
vmap.set("n", "n", "nzzzv")
vmap.set("n", "N", "Nzzzv")
-- Copy the clipboard content into system clipboard
vmap.set({"n", "v"}, "<leader>y", [["+y]])
vmap.set("n", "<leader>Y", [["+Y]])
-- Modify the word under the cursor in the whole file
vmap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- Insert blank lines
vmap.set("n", "<leader>o",'o<Esc>0"_D')
vmap.set("n", "<leader>O",'O<Esc>0"_D')
