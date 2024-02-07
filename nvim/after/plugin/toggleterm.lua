print("Hello from Toggle Term file")

require('toggleterm').setup{
  size = 20,
  open_mapping = [[<C-t>]], -- Example mapping to open toggleterm
  -- open_mapping = [[<leader>t]], -- Example mapping to open toggleterm
  hide_numbers = true,
  shade_filetypes = {},
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  --direction = 'float',
  direction = 'horizontal',
  close_on_exit = true,
  -- And other configuration options...
}

-- Key mapping to exit the terminal mode using <Esc>
vim.api.nvim_set_keymap("t", "<Esc>", [[<C-\><C-n>]], {noremap = true, silent = true})

-- Custom Shortcuts
local function open_term_in_current_dir()
  local current_dir = vim.fn.expand('%:p:h')
  local term_cmd = 'cd ' .. current_dir .. ' && clear' -- Concatenate with '..'
  require('toggleterm.terminal').Terminal:new({
    -- cmd = term_cmd,
    dir = current_dir,
    -- direction = "float"
  }):toggle()
end

vim.api.nvim_create_user_command('TermCD', open_term_in_current_dir, {})

vim.api.nvim_set_keymap("n", "<leader>tcd", [[<C-\><C-n>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>tcd', ':TermCD<CR>', { noremap = true, silent = true })

