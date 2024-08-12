return {
	'preservim/nerdtree',
    config = function ()
-- Toggle Nerdtree with ctr n
vim.api.nvim_set_keymap('n', '<C-n>', ':NERDTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '++', '<plug>NERDCommenterToggle', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '++', '<plug>NERDCommenterToggle', { noremap = true, silent = true })

-- Auto-command to quit Neovim if NERDTree is the last window open
--vim.cmd[[ autocmd VimEnter * NERDTree ]]

-- close NVIM after :q if nerdtree would stay as the last window
vim.cmd[[
  autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
]]


-- find open file in nerdtree (nerdtree must be opened)
vim.api.nvim_set_keymap('n', '<leader>nf', ':NERDTreeFind<CR>', { noremap = true, silent = true })
        -- require("nerdtree").setup()
    end
}
