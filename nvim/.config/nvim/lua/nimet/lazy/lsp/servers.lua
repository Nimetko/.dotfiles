local M = {}

M.setup_servers = function(on_attach, capabilities)
    local lspconfig = require("lspconfig")

    lspconfig.lua_ls.setup {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" }
                }
            }
        }
    }

    lspconfig.dartls.setup {
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
        }
    }

    -- Add more server configurations here

    if vim.fn.has("win32") == 1 then
        lspconfig.omnisharp.setup({
            cmd = { "C:\\Users\\janbo\\.omnisharp\\Omnisharp.exe", "--languageserver" },
            on_attach = on_attach,
            capabilities = capabilities,
        })
    else
        lspconfig.omnisharp.setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })
    end
end

return M

