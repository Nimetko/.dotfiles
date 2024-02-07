local builtin = require('telescope.builtin')

function SearchInDotFiles()
    builtin.find_files({
        prompt_title = 'Dotfiles',
        cwd = 'C:/x/',
        find_command = { 'rg', '--files', '--hidden', '--no-ignore', '--glob', '!.git' },
    })
end

vim.keymap.set('n', '<leader>fo', SearchInDotFiles, {})

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fi', builtin.git_files, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

