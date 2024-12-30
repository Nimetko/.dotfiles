vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.dart",
    callback = function()
        -- Save the current view (cursor position, scroll position, etc.)
        local view = vim.fn.winsaveview()
        -- Re-indent the file without affecting cursor history
        vim.api.nvim_exec("keepjumps normal! gg=G", false)
        -- Restore the saved view
        vim.fn.winrestview(view)
    end,
})

