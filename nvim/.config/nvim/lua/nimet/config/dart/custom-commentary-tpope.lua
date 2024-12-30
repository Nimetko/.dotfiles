-- dart comments for commentary tpope plugin
vim.api.nvim_create_autocmd("FileType", {
  pattern = "dart",
  callback = function()
    vim.bo.commentstring = "// %s"
  end,
})

