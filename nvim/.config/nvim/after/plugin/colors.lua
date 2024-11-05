function ColorMyPencils(color)
--     vim.cmd("hi clear")
-- if vim.fn.exists("syntax_on") then vim.cmd("syntax reset") end
	color = color or "rose-pine"
    -- require("nimet.themes.fallout").apply();
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none"})
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none"})
end

ColorMyPencils()

