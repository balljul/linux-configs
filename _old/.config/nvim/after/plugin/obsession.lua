vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  callback = function()
    if #vim.fn.argv() == 0 and not vim.fn.exists("s:std_in") then
      vim.cmd("Obsession")
    end
  end,
})

