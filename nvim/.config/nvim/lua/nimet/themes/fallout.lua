-- ~/.config/nvim/lua/themes/fallout.lua
local fallout = {}

fallout.colors = {
    -- bg       = "#0f0f0f",  -- Dark background
    bg       = "#00ff33",  -- Dark background
    fg       = "#00FF00",  -- Bright green text (Pip-Boy color)
    cursor   = "#00FF00",  -- Green cursor
    selection = "#007F00", -- Dark green for selection
    comment  = "#007F00",  -- Dark green for comments
    constant = "#00FF00",  -- Green for constants
    function_color = "#00FF7F",  -- Light green for functions
    type_color = "#00FF00",  -- Green for types
    keyword_color = "#00FF00",  -- Green for keywords
}

-- Applying the theme
fallout.apply = function()
    -- typing text

    -- Set terminal colors for Pip-Boy style
    vim.g.terminal_color_0 = fallout.colors.bg
    vim.g.terminal_color_1 = fallout.colors.fg
    vim.g.terminal_color_2 = fallout.colors.selection
    vim.g.terminal_color_3 = fallout.colors.comment
    vim.g.terminal_color_4 = fallout.colors.constant
    vim.g.terminal_color_5 = fallout.colors.function_color
    vim.g.terminal_color_6 = fallout.colors.type_color
    vim.g.terminal_color_7 = fallout.colors.fg

    -- Set basic UI colors
    vim.api.nvim_set_hl(0, "Normal", { fg = fallout.colors.fg, bg = fallout.colors.bg })
    vim.api.nvim_set_hl(0, "CursorLine", { bg = "#101010" })  -- Slightly lighter background for cursor line
    vim.api.nvim_set_hl(0, "Visual", { bg = fallout.colors.selection }) -- Visual mode selection
    vim.api.nvim_set_hl(0, "Cursor", { fg = fallout.colors.bg, bg = fallout.colors.cursor })

    -- Statusline and Line Numbers
    vim.api.nvim_set_hl(0, "StatusLine", { fg = fallout.colors.fg, bg = fallout.colors.bg, bold = true })
    vim.api.nvim_set_hl(0, "LineNr", { fg = fallout.colors.comment })
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = fallout.colors.fg, bold = true })

    -- Set syntax highlighting
    vim.api.nvim_set_hl(0, "Comment", { fg = fallout.colors.comment, italic = true })
    vim.api.nvim_set_hl(0, "Constant", { fg = fallout.colors.constant })
    vim.api.nvim_set_hl(0, "Function", { fg = fallout.colors.function_color })
    vim.api.nvim_set_hl(0, "Keyword", { fg = fallout.colors.keyword_color, bold = true })
    vim.api.nvim_set_hl(0, "Type", { fg = fallout.colors.type_color, bold = true })
    vim.api.nvim_set_hl(0, "String", { fg = fallout.colors.fg })

    -- Custom for UI elements
    vim.api.nvim_set_hl(0, "Pmenu", { fg = fallout.colors.fg, bg = fallout.colors.bg })
    vim.api.nvim_set_hl(0, "PmenuSel", { bg = fallout.colors.selection })
    vim.api.nvim_set_hl(0, "VertSplit", { fg = fallout.colors.selection })
    vim.api.nvim_set_hl(0, "NormalFloat", { fg = fallout.colors.fg, bg = "#101010" })
end

return fallout

