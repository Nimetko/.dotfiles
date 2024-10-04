local M = {}

function M.setup_diagnostics()
    vim.diagnostic.config({
        update_in_insert = true,  -- Update diagnostics while in insert mode
        float = {  -- Configure floating diagnostic windows
            focusable = false,   -- The floating window cannot be focused
            style = "minimal",   -- Minimalistic floating window
            border = "rounded",  -- Rounded borders for the floating window
            source = "always",   -- Always show the source of the diagnostic
            header = "",         -- No header in the floating window
            prefix = "",         -- No prefix for diagnostic messages
        },
    })
end

return M

--[[
Summary of Relevant Dependencies for Diagnostics:

- "neovim/nvim-lspconfig": For configuring LSP servers that provide diagnostics.

- "williamboman/mason.nvim" and "williamboman/mason-lspconfig.nvim": 
  For managing and installing LSP servers.

- "hrsh7th/nvim-cmp": For autocompletion and integration with LSP 
  features like diagnostics.

Optional Enhancements:

- "nvim-telescope/telescope.nvim": For searching and navigating diagnostics.

- "glepnir/lspsaga.nvim": For enhanced diagnostic UI.

- "nvim-lua/diagnostic-nvim": For enhanced diagnostic message handling.

For the basic Neovim LSP diagnostics to work, the primary dependencies 
are "nvim-lspconfig" and any installed LSP servers that support diagnostics. 
The rest are optional or provide enhanced features.
]]

--[[
What Diagnostics Does:
- Error Checking: When you write code, the LSP server (which is aware of the 
  language you're coding in) analyzes your code in real-time and provides 
  feedback if it detects errors. For example, if there's a syntax error, 
  missing imports, or invalid function calls, the LSP server will provide 
  diagnostics (errors).

- Warnings: These highlight potential issues that might not stop your code 
  from running but could lead to problems. For example, an unused variable or 
  deprecated functions might trigger a warning.

- Hints: The LSP server might also offer suggestions or optimizations, such as 
  recommending a better way to write a piece of code or suggesting that you 
  add documentation.

- Informational Messages: These can include tips, formatting suggestions, or 
  other general guidance provided by the LSP server.
]]

