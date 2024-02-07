print("Hello from Nimet lua file")
-- init.lua

require('nimet/packer')

-- Use powershell if os is windows:
require('toggleterm').setup{
  -- other options...
  shell = vim.loop.os_uname().sysname == "Windows_NT" and 'powershell.exe' or vim.o.shell,
  -- other settings...
}

require('nimet/remap')

require('nimet/set')

-- Additional configurations (add your desired configurations below)
-- For example:
-- vim.o.number = true  -- Show line numbers
