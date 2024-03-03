local lsp_config = require("lspconfig")
local lsp = require("lsp-zero")

lsp.preset("recommended")

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

local function myFunction(opts)

vim.keymap.set("n", "<leader>lsp", function()
    print("LSP")
end)

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts) -- vim.keymap.set("n", "gh", function() vim.lsp.buf.hover() end, opts) -- can't be this, it's just not working
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)

  vim.keymap.set("n", "gr", function()
    require('telescope.builtin').lsp_references({use_quickfix = true})
end)

  vim.keymap.set("n", "<leader>vr", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
  vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.formatting() end, opts)

end

-- Define your on_attach function
local on_attach = function(client, bufnr)
  local opts = { noremap=true, silent=true, buffer=bufnr }

  vim.api.nvim_buf_del_keymap(bufnr, 'n', 'gr')
  myFunction(opts);
end

local on_attach_dart = function(client, bufnr)
  local opts = { noremap=true, silent=true, buffer=bufnr }

  myFunction(opts);
end


-- Set on_attach function for all LSP servers managed by lsp-zero
lsp.on_attach(on_attach)

-- lsp.on_attached = on_attach

lsp_config["dartls"].setup({
  -- on_attach = on_attach,
  on_attach = on_attach_dart,
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

-- local utils = require('nimet/utils')
-- local is_windows = utils.isWindows()

-- if is_windows then
--   lsp_config["omnisharp"].cmd = { "C:\\Users\\janbo\\.omnisharp\\Omnisharp.exe", "--languageserver" }
-- else
--   lsp_config["omnisharp"].cmd = { "/Users/jan/x/work/omnisharp-roslyn/mono-packaging/run", "--languageserver" }
-- end

-- lsp_config["omnisharp"].setup{
--   on_attach = on_attach
-- }

-- -- lsp_config.omnisharp.setup({
-- --   on_attach = on_attach
-- -- })

-- Now setup your LSP servers with lsp-zero
lsp.setup()

-- Diagnostic configuration
vim.diagnostic.config({
    virtual_text = true
})

