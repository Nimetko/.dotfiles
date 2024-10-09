-- Set up nvim-cmp.
local cmp = require('cmp')

local M = {}

--- Setup completion for Neovim using nvim-cmp and luasnip
-- 
-- This function configures Neovim's cmp plugin to use luasnip for snippet 
-- expansion and sets up custom key mappings for navigation and confirmation.
-- It also defines the completion sources (LSP, buffer, and luasnip).
--
-- Key mappings:
--  - <C-p>: Select previous completion item
--  - <C-n>: Select next completion item
--  - <C-y>: Confirm the selected completion
--  - <C-Space>: Trigger completion
--
-- Sources:
--  - LSP completions (nvim_lsp)
--  - Snippets (luasnip)
--  - Buffer contents (buffer)
--
function M.setup_cmp()
    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    cmp.setup({
        snippet = {
            expand = function(args)
                require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            end,
        },
        mapping = cmp.mapping.preset.insert({
            ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
            ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
            ['<C-y>'] = cmp.mapping.confirm({ select = true }),
            ["<C-Space>"] = cmp.mapping.complete(),
        }),
        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'luasnip' }, -- For luasnip users.
        }, {
            { name = 'buffer' },
        })
    })
end

return M
