-- Set the 'leader' key to a space for creating custom shortcuts
vim.g.mapleader = " "

-- make sure copy and paste works with the system clipboard
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', { noremap = true, silent = true })

-- bind next buffer and previous buffer
vim.api.nvim_set_keymap('n', 'L', ':bnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'H', ':bprevious<CR>', { noremap = true, silent = true })
--
-- set cd to the directory of the current file
vim.api.nvim_set_keymap('n', '<leader>cd', ':cd %:p:h<CR>', { noremap = true, silent = true })

-- Set key binding for 'pv' in normal mode to open the command line
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Visual mode bindings for moving blocks of text up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Normal mode binding to join lines without spaces and restore cursor position
vim.keymap.set("n", "J", "mzJ`z")

-- Normal mode bindings to scroll half-page and recenter the cursor
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Normal mode bindings to jump to next/previous search result and recenter the line
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Normal mode bindings to start and stop "vim-with-me" sessions
vim.keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
    require("vim-with-me").StopVimWithMe()
end)

-- greatest remap ever
-- Visual block mode mapping for pasting over without yanking the replaced text
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
-- Normal and visual mode mapping to yank text into the system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Normal and visual mode mapping to delete text without yanking
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-----------------------
---- My Cutom Shortcuts
-----------------------

-- Remap ; to : in normal mode
vim.keymap.set('n', ';', ':', { noremap = true, silent = true })

-- Text alligning


-- Enable syntax highlighting
vim.cmd('syntax on')

-- when in c# filetype, run dotnet run from leader + r
-- vim.api.nvim_create_autocmd("FileType", {
--     pattern = "cs",
--     callback = function()
--         vim.api.nvim_buf_set_keymap(0, 'n', '<C-i>', ':!dotnet run<CR>', { noremap = true, silent = true })
--     end,
-- })

-- Normal mode custom shortcuts for saving and quitting
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")

-- Moving to different windows
vim.keymap.set("n", "<leader>h", "<C-w>h")
vim.keymap.set("n", "<leader>j", "<C-w>j")
vim.keymap.set("n", "<leader>k", "<C-w>k")
vim.keymap.set("n", "<leader>l", "<C-w>l")

---- Splitting Screen
-- vertical split
vim.keymap.set("n", "<leader>s", "<C-w-s>") 
-- horizontal split
-- vim.keymap.set("n", "<leader>v", "<C-w-v>")


-- Telescope plugin key bindings for various find and search functions
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fi', builtin.git_files, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})



-- Key binding to open a terminal in the bottom split with PowerShell
--vim.api.nvim_set_keymap('n', '<leader>t', ':botright 10split | terminal powershell<CR>', { noremap = true, silent = true })

-- Insert mode binding to escape to normal mode
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Normal mode binding to disable the 'Q' command
vim.keymap.set("n", "Q", "<nop>")

-- Normal mode binding to open tmux sessionizer
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww ~/x/scripts/tmux-sessionizer<CR>")

-- Normal mode binding for formatting code using Language Server Protocol
-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Normal mode bindings for navigating through quickfix and location lists
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
--vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
--vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Normal mode binding for easier search and replace
-- vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<-r><C-w>/gI<Left><Left><Left>]])

-- Normal mode binding to make the current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Normal mode bindings for editing specific configuration files
vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

-- Normal mode binding to source a file with double tapping the leader key
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")


-- Normal Mode Binding go to previous and next visited buffers
vim.keymap.set('n', 'H', ':bprevious<CR>', {noremap = true, silent = true})
vim.keymap.set('n', 'L', ':bnext<CR>', {noremap = true, silent = true})

end)

