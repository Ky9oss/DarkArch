vim.api.nvim_create_autocmd("QuitPre", {
  callback = function()
    if vim.fn.exists(":MinimapClose") == 2 then
      pcall(vim.cmd, "silent! MinimapClose")
    end
  end,
})

