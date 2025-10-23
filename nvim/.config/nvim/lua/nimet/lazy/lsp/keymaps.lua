local M = {}

-- print("Hello from lazy/lsp/keymaps.lua")

function M.setup_lsp_keymaps(opts)
    -- print("setup_lsp_keymaps Hello from lazy/lsp/keymaps.lua")
    vim.keymap.set("n", "<leader>lsp", function() print("LSP") end)
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)

    -- local function supports(method)
    --     local clients = vim.lsp.get_clients({ bufnr = 0, method = method })
    --     return clients and #clients > 0
    -- end

    -- vim.keymap.set("n", "gd", function()
    --     if supports("textDocument/definition") then
    --         require("telescope.builtin").lsp_definitions({ initial_mode = "normal" })
    --     else
    --         vim.lsp.buf.definition()
    --     end
    -- end, opts)

    -- vim.keymap.set("n", "gd", function()
    --     require('telescope.builtin').lsp_definitions({ initial_mode = "normal" })
    -- end, opts)
    vim.keymap.set("n", "gh", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "gr", function() require('telescope.builtin').lsp_references({ use_quickfix = true, initial_mode = "normal" }) end)
    vim.keymap.set("n", "<leader>vr", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.formatting() end, opts)
end

return M
