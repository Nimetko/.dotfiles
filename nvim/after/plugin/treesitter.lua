require'nvim-treesitter.configs'.setup {
	ensure_installed = { "javascript", "lua", "vim", "vimdoc", "query", "c_sharp", "dart", "json"},

	sync_install = false,

	auto_install = true,

	highlight = {
		enable = true,

		additional_vim_regex_highlighting = false,
	},
}
