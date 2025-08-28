local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- 打开 DAP UI
map("n", "<leader>o", function()
  require("dapui").open()
end, opts)

-- 关闭 DAP UI
map("n", "<leader>c", function()
  require("dapui").close()
end, opts)

-- 切换 DAP UI
map("n", "<leader>t", function()
  require("dapui").toggle()
end, opts)

vim.keymap.set('n', '<C-w>H', require('smart-splits').resize_left)
vim.keymap.set('n', '<C-w>J', require('smart-splits').resize_down)
vim.keymap.set('n', '<C-w>K', require('smart-splits').resize_up)
vim.keymap.set('n', '<C-w>L', require('smart-splits').resize_right)
-- moving between splits
vim.keymap.set('n', '<C-w>h', require('smart-splits').move_cursor_left)
vim.keymap.set('n', '<C-w>j', require('smart-splits').move_cursor_down)
vim.keymap.set('n', '<C-w>k', require('smart-splits').move_cursor_up)
vim.keymap.set('n', '<C-w>l', require('smart-splits').move_cursor_right)
-- vim.keymap.set('n', '<C-\\>', require('smart-splits').move_cursor_previous)
