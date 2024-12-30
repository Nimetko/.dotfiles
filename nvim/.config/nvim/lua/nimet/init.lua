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

-- dart
require('nimet/config/dart/auto-indent')
require('nimet/config/dart/custom-commentary-tpope')
require('nimet/config/dart/dart-indent-type')
