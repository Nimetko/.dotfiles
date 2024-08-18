-- Custom Commands
vim.api.nvim_create_user_command('CopyPath', function()
  vim.fn.setreg('+', vim.fn.expand('%:p'))
end, {})

