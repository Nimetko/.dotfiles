print("Hello from Nimet lua file")
-- init.lua

require('nimet/packer')

local utils = require('nimet/utils')
-- Use powershell if os is windows:
require('toggleterm').setup{
  -- other options...
  shell =  utils.isWindows() and 'powershell.exe' or vim.o.shell,
  -- other settings...
}

require('nimet/remap')

require('nimet/set')

-- Additional configurations (add your desired configurations below)
-- For example:
-- vim.o.number = true  -- Show line numbers
