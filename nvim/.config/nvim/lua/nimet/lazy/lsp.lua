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
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities()
        )


        --------------------- keymaps --------------------------
        local keymaps = require("nimet.lazy.lsp.keymaps")

        -- On attach function for LSP key mappings
        local on_attach = function(client, bufnr)
            local opts = { noremap=true, silent=true, buffer=bufnr }
            keymaps.setup_lsp_keymaps(opts)
        end
        --------------------- keymaps end --------------------------

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
        require("nimet.lazy.lsp.cmp_config").setup_cmp()

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

