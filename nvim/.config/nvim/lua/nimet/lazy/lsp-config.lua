-- folowing typecraft ... https://www.youtube.com/watch?v=S-xzYgTLVJE&t=884s&ab_channel=typecraft
        -- print("Hello from lazy/lsp-config.lua")
return {
    {
        -- https://github.com/williamboman/mason.nvim
        -- for installing language server
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
            -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

    },
    {
        -- https://github.com/williamboman/mason-lspconfig.nvim (gap between mason and lspconfig) (good for ensure installed method)
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "ts_ls",
                    "omnisharp",
                }
            })
        end
    },
    {
    -- nvim lspconfig -- setting keybindings and communcation between language server and neovim
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            -- setting setup for different languages
            lspconfig.lua_ls.setup({})
            lspconfig.ts_ls.setup({})
                        -- C#
            lspconfig.omnisharp.setup({
                cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
                root_dir = lspconfig.util.root_pattern("*.sln", "*.csproj", ".git"),
                settings = {
                    FormattingOptions = {
                        EnableEditorConfigSupport = true,
                    },
                    Sdk = {
                        IncludePrereleases = true,
                    },
                },
            })

        local keymaps = require("nimet.lazy.lsp.keymaps")
        local opts = { noremap=true, silent=true}
        keymaps.setup_lsp_keymaps(opts)
        ----------------- SNIPSETS -----------------
        require("nimet.lazy.lsp.cmp_config").setup_cmp()

        ----------------- DIAGNOSTICS -----------------
        require("nimet.lazy.lsp.diagnostic").setup_diagnostics()


        end
    }
}
