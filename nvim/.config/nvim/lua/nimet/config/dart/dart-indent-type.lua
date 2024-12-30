-- dart style indendtion
vim.api.nvim_create_autocmd("FileType", {
    pattern = "dart",
    callback = function()
        vim.bo.shiftwidth = 2
        vim.bo.tabstop = 2
        vim.bo.expandtab = true
    end,
})
