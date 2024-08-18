-- utils.lua

local M = {}

function M.isWindows()
    return vim.loop.os_uname().sysname == "Windows_NT"
end

return M

