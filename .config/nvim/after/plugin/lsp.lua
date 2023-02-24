-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase

-- neodev must be setup before lspconfig
require("neodev").setup({
  library = { plugins = { "nvim-dap-ui", "neotest" }, types = true },
})

local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr}
  local bind = vim.keymap.set

  bind('n', '<leader>rnm', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  bind("n", "<leader>act", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  -- more keybindings...
end)
lsp.set_preferences({
  set_lsp_keymaps = true, --[[ set to false if you want
    to configure your own keybindings]]--
  manage_nvim_cmp = true, --[[set to false if you want to configure
    nvim-cmp on your own]]--
})
-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()
lsp.setup()

lsp.setup_nvim_cmp({
  sources = {
    {name = "nvim_lua"},
    {name = 'path'},
    {name = 'nvim_lsp'},
    {name = 'buffer', keyword_length = 3},
    {name = 'luasnip', keyword_length = 2},
    {name = 'nvim_lsp_signature_help'}
  }
})







