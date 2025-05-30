return {
    {"nvim-telescope/telescope.nvim",

        tag = "0.1.5",

        dependencies = {
            "nvim-lua/plenary.nvim"
        },

        config = function()
            require('telescope').setup({})

            local builtin = require('telescope.builtin')

            local function SearchInDotFiles()
                builtin.find_files({
                    prompt_title = 'Dotfiles',
                    cwd = '~/x/',
                    find_command = {
                        'rg',               -- use ripgrep as the file finder
                        '--files',          -- list files only (no content search)
                        '--hidden',         -- include hidden files (e.g., .bashrc)
                        '--no-ignore',      -- don't respect .gitignore or .ignore files
                        '--glob', '!.git',  -- exclude the .git directory
                        '--glob', 'personal/**',  -- include everything inside x/personal/
                        '--glob', '.dotfiles/**', -- include everything inside x/.dotfiles/
                        '--glob', 'scripts/**',   -- include everything inside x/scripts/
                    },
                })
            end


            vim.keymap.set('n', '<leader>fo', SearchInDotFiles, {})

            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<c-p>', builtin.find_files, {})

            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>fi', builtin.git_files, {})
            vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
            vim.keymap.set('n', '<leader>fd', builtin.diagnostics, {})
            vim.keymap.set("n", "<leader>fe", function()
                require("telescope.builtin").diagnostics({ severity = vim.diagnostic.severity.ERROR })
            end, { noremap = true, silent = true })
        end

    },

    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {}
                    }
                }
            })
            require("telescope").load_extension("ui-select")
        end
    },

}

