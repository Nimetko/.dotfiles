local function remove_timestamps()
  vim.cmd([[ %s/^\d\{4}-\d\{2}-\d\{2}T\d\{2}:\d\{2}:\d\{2}\.\d\+Z\s\+// ]])
end

local function remove_debugs()
  vim.cmd([[ g/^##\[DEBUG\]/d ]])
end

local function remove_write_text()
  vim.cmd([[ g/^\[\d\+\/\d\+\s\+.*\] WriteText/d ]])
end

local function remove_csc_lines()
  vim.cmd([[ g/^\[\s\+\d\+s\] Csc/d ]])
end

local function show_menu()
  print("Choose an option:")
  print("1. Remove timestamps")
  print("2. Remove debug lines (##[DEBUG])")
  print("3. Remove WriteText lines")
  print("4. Remove Csc lines")

  local choice = vim.fn.input("Enter choice (1-4): ")

  if choice == "1" then
    remove_timestamps()
  elseif choice == "2" then
    remove_debugs()
  elseif choice == "3" then
    remove_write_text()
  elseif choice == "4" then
    remove_csc_lines()
  else
    print("Invalid choice")
  end
end

return {
  show_menu = show_menu
}

