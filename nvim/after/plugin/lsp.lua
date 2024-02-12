local lsp_zero = require("lsp-zero")
local lsp_config = require("lspconfig")

lsp_zero.preset("recommended")

lsp_zero.ensure_installed({
  'tsserver',
  'rust_analyzer',
  'lua_ls',
})

-- Fix Undefined global 'vim'
lsp_zero.nvim_workspace()

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp_zero.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp_zero.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp_zero.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

local on_attach = function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts) vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts) -- vim.keymap.set("n", "gh", function() vim.lsp.buf.hover() end, opts) -- can't be this, it's just not working
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
  vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.formatting() end, opts)
end

lsp_zero.on_attached = on_attach

lsp_config["dartls"].setup({
  on_attach = on_attach,
  settings = {
    dart = {
      analysisExcludedFolders = {
        vim.fn.expand("$HOME/AppData/Local/Pub/Cache"),
        vim.fn.expand("$HOME/.pub-cache"),
        vim.fn.expand("/opt/homebrew/"),
        vim.fn.expand("$HOME/tools/flutter/"),
      },
    },
  },
})

-- pasted start
-- require'lspconfig'.omnisharp.setup{
lsp_config["omnisharp"].setup{
  on_attach = on_attach,
  -- cmd = { "<path-to-omnisharp>/run", "--languageserver" , "--hostPID", tostring(pid) },
  -- cmd = { "C:/source/omnisharp/omnisharp/Omnisharp.exe", "--languageserver"},
  cmd = { "C:/Users/janbo/.omnisharp/Omnisharp.exe", "--languageserver"},
  -- cmd = { "C:/source/omnisharp/omnisharp/Omnisharp.exe" },
  -- More configuration options can be added here
}
-- pasted end


lsp_zero.setup()

vim.diagnostic.config({
    virtual_text = true
})

-- require'lspconfig'.omnisharp.setup{
--   -- other configurations
--   autostart = false,
-- }

