require('nimet/set')
require('nimet/remap')
require("nimet.lazy_init")

local utils = require('nimet/utils')
-- Use powershell if os is windows:
require('toggleterm').setup{
  -- other options...
  shell =  utils.isWindows() and 'powershell.exe' or vim.o.shell,
  -- other settings...
}


-- Additional configurations (add your desired configurations below)
-- For example:
-- vim.o.number = true  -- Show line numbers

require('nimet/customCommands')

-- dart comments for commentary tpope plugin
vim.api.nvim_create_autocmd("FileType", {
  pattern = "dart",
  callback = function()
    vim.bo.commentstring = "// %s"
  end,
})

