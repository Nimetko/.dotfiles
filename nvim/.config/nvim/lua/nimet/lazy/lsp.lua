return {
    "neovim/nvim-lspconfig",  -- The official plugin for configuring Neovim's built-in LSP (Language Server Protocol) client.

    dependencies = {
        "williamboman/mason.nvim",  -- Mason is a Neovim plugin that allows you to easily install and manage LSP servers, DAP servers, linters, and formatters.
        "williamboman/mason-lspconfig.nvim",  -- A bridge plugin that integrates Mason with nvim-lspconfig, making it easier to automatically configure and manage LSP servers installed via Mason.
        -- we have ensureInstalled thasnk to this

        "hrsh7th/cmp-nvim-lsp",  -- A completion source for nvim-cmp, providing LSP-based completions in the Neovim editor.
        "hrsh7th/cmp-buffer",  -- A completion source for nvim-cmp that provides buffer (current file) based completions.
        "hrsh7th/cmp-path",  -- A completion source for nvim-cmp that provides file path completions.
        "hrsh7th/cmp-cmdline",  -- A completion source for nvim-cmp that provides command-line completions, enhancing the command-line experience in Neovim.
        "hrsh7th/nvim-cmp",  -- A highly extensible completion plugin for Neovim, which supports various sources like LSP, buffer, path, etc.

        "L3MON4D3/LuaSnip",  -- A Lua-based snippet engine for Neovim, allowing you to use and create code snippets for faster coding.
        "saadparwaiz1/cmp_luasnip",  -- A completion source for nvim-cmp, providing LuaSnip-based completions in Neovim.

        -- Extensible UI for Neovim notifications and LSP progress messages.
        "j-hui/fidget.nvim",  -- A plugin that provides a small, fidget spinner-like UI element to display LSP progress and notifications, making it easier to track LSP-related tasks.
    },

    config = function()
        local cmp = require('cmp')
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())

        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            --
            -- ENSURE INSTALLED -- ensuring what language servers installing autimatically
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
            },
            -- ENSURE INSTALLED -- ensuring what language servers installing autimatically
            --
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,

                zls = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.zls.setup({
                        root_dir = lspconfig.util.root_pattern(".git", "build.zig", "zls.json"),
                        settings = {
                            zls = {
                                enable_inlay_hints = true,
                                enable_snippets = true,
                                warn_style = true,
                            },
                        },
                    })
                    vim.g.zig_fmt_parse_errors = 0
                    vim.g.zig_fmt_autosave = 0

                end,
                --
                -- Settting lsp communication with lua_ls language server --
                --
                -- ["lua_ls"] = function()
                --     local lspconfig = require("lspconfig")
                --     lspconfig.lua_ls.setup {
                --         capabilities = capabilities,
                --         settings = {
                --             lua = {
                --                 runtime = { version = "lua 5.1" },
                --                 diagnostics = {
                --                     globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
                --                 }
                --             }
                --         }
                --     }
                -- end,
                --
                -- Settting lsp communication with lua_ls language server --
                --


                -- Omnisharp (C#) setup with Mono
                omnisharp = function()
                    -- Change this to your actual download path.
                    -- local path_to_download = '/Users/dzfrias/.dotfiles/downloads/omnisharp-osx'
                    local path_to_download = '/Users/janborovsky/omnisharp-osx-arm64-net6.0'
                    require('lspconfig').omnisharp.setup {
                        cmd = {
                            'mono',
                            '--assembly-loader=strict',
                            path_to_download .. '/omnisharp/OmniSharp.exe',
                        },
                        -- Assuming you have an on_attach function. Delete this line if you don't.
                        on_attach = on_attach,
                        use_mono = true,
                    }
                end,


                -- mono = function ()
                --     -- Change this to your actual download path.
                --     local path_to_download = '~/omnisharp-osx-arm64-net6.0/'
                --     require('lspconfig').omnisharp.setup {
                --         cmd = {
                --             'mono',
                --             '--assembly-loader=strict',
                --             path_to_download .. '/omnisharp/OmniSharp.exe',
                --         },
                --         -- Assuming you have an on_attach function. Delete this line if you don't.
                --         on_attach = on_attach,
                --         use_mono = true,
                --     }
                -- end













                
            }
        })

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

        vim.diagnostic.config({
            -- update_in_insert = true,
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
