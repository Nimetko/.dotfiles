vim.opt.nu = true
vim.opt.relativenumber = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true -- autoindent new lines

vim.opt.wrap = false -- don't wrap lines

vim.opt.swapfile = false -- don't create swap files
vim.opt.backup = false -- don't create backup files

local utils = require('nimet/utils')

local is_windows = utils.isWindows()

if is_windows then
vim.opt.undodir = os.getenv("USERPROFILE") .. "\\.vim\\undodir"
else
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir" -- set undo directory
end

vim.opt.undofile = true -- enable undo files

vim.opt.hlsearch = true -- don't highlight search results
vim.opt.incsearch = true -- incremental search

vim.opt.ignorecase = true -- ignore case when searching

vim.opt.termguicolors = true -- enable 24-bit RGB colorscheme

vim.opt.scrolloff = 8 -- keep 8 lines above and below cursor
vim.opt.signcolumn = "yes" -- always show sign column , warnings, errors, etc
vim.opt.isfname:append("@-@") -- allow @ in filenames

vim.opt.updatetime = 50 -- update interval for gitsigns, default: 4000
vim.wo.colorcolumn = "80" -- set color column to 80 characters
