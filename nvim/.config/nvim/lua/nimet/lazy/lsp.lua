return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
    },

    config = function()
        local cmp = require('cmp')
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities()
        )

        -- Define your custom on_attach function to set LSP key mappings
        local function myFunction(opts)
            vim.keymap.set("n", "<leader>lsp", function() print("LSP") end)
            vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
            vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
            vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
            vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
            vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
            vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
            vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
            vim.keymap.set("n", "gr", function() require('telescope.builtin').lsp_references({ use_quickfix = true }) end)
            vim.keymap.set("n", "<leader>vr", function() vim.lsp.buf.rename() end, opts)
            vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
            vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.formatting() end, opts)
        end

        -- On attach function for LSP key mappings
        local on_attach = function(client, bufnr)
            local opts = { noremap=true, silent=true, buffer=bufnr }
            myFunction(opts)
        end



        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "tsserver",
            },
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities,
                        on_attach = on_attach, -- Add the on_attach function
                    }
                end,

                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        on_attach = on_attach, -- Add the on_attach function
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim" }
                                }
                            }
                        }
                    }
                end,
            }
        })

        -- Example of configuring dartls with a specific on_attach function
        local lsp_config = require("lspconfig")
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

        -- Check if you are on Windows and configure Omnisharp accordingly
        if vim.fn.has("win32") == 1 then
            lsp_config["omnisharp"].setup({
                cmd = { "C:\\Users\\janbo\\.omnisharp\\Omnisharp.exe", "--languageserver" },
                on_attach = on_attach,
                capabilities = capabilities,
            })
        else
            lsp_config["omnisharp"].setup({
                -- Uncomment and configure if on a different OS
                -- cmd = { "/Users/jan/x/work/omnisharp-roslyn/mono-packaging/run", "--languageserver" },
                on_attach = on_attach,
                capabilities = capabilities,
            })
        end

        ------- THIS IS RESPONSIBLE FOR SNIPSET ------

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
        ------- END OF THIS IS RESPONSIBLE FOR SNIPSET ------

        -- Diagnostic configuration
        vim.diagnostic.config({
            update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end
}

