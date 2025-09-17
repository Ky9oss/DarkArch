local map = vim.keymap.set
local opts = { noremap = true, silent = true }
local smart_splits = require('smart-splits')


-- DAP UI
map("n", "<leader>o", function()
  require("dapui").open()
end, opts)

map("n", "<leader>c", function()
  require("dapui").close()
end, opts)

map("n", "<leader>t", function()
  require("dapui").toggle()
end, opts)


-- dap
vim.api.nvim_set_keymap("n", "<leader>b", "<cmd>DapToggleBreakpoint<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>i", "<cmd>DapStepInto<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>u", "<cmd>DapStepOut<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>v", "<cmd>DapStepOver<CR>", { noremap = true, silent = true })


-- smart-splits
vim.keymap.set('n', '<C-w>H', require('smart-splits').resize_left)
vim.keymap.set('n', '<C-w>J', require('smart-splits').resize_down)
vim.keymap.set('n', '<C-w>K', require('smart-splits').resize_up)
vim.keymap.set('n', '<C-w>L', require('smart-splits').resize_right)

vim.keymap.set('n', '<C-w>h', require('smart-splits').move_cursor_left)
vim.keymap.set('n', '<C-w>j', require('smart-splits').move_cursor_down)
vim.keymap.set('n', '<C-w>k', require('smart-splits').move_cursor_up)
vim.keymap.set('n', '<C-w>l', require('smart-splits').move_cursor_right)


-- lspsaga
-- vim.api.nvim_del_keymap('n', 'K')
-- vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>', { noremap = true, silent = true })
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    -- 给所有 LSP buffer 强制设置
    vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>', {
      buffer = ev.buf,
      noremap = true,
      silent = true,
    })
  end,
})


-- telescope


-- local function move_cursor(direction)
--     if direction == 'h' then
--         smart_splits.move_cursor_left()
--     elseif direction == 'j' then
--     elseif direction == 'k' then
--     elseif direction == 'l' then
--     else
--     end
-- end
--
-- -- 跳过标记窗口的窗口移动函数
-- local function skip_window(direction)
--   local cur_win = vim.api.nvim_get_current_win()
--   -- 先移动一次
--   vim.cmd("wincmd " .. direction)
--   local next_win = vim.api.nvim_get_current_win()
--
--   -- 如果新窗口被标记为 skip_for_ctrlw，继续跳过
--   while true do
--     local ok, skip = pcall(vim.api.nvim_win_get_var, next_win, "skip_for_ctrlw")
--     if ok and skip then
--       -- 继续移动
--       vim.cmd("wincmd " .. direction)
--       next_win = vim.api.nvim_get_current_win()
--     else
--       break
--     end
--   end
-- end
--
-- -- 绑定快捷键
-- vim.keymap.set('n', '<C-W>h', function() skip_window('h') end, { silent = true })
-- vim.keymap.set('n', '<C-W>j', function() skip_window('j') end, { silent = true })
-- vim.keymap.set('n', '<C-W>k', function() skip_window('k') end, { silent = true })
-- vim.keymap.set('n', '<C-W>l', function() skip_window('l') end, { silent = true })



-- persistence
-- -- load the session for the current directory
-- vim.keymap.set("n", "<leader>qs", function() require("persistence").load() end)
--
-- -- select a session to load
-- vim.keymap.set("n", "<leader>qS", function() require("persistence").select() end)
--
-- -- load the last session
-- vim.keymap.set("n", "<leader>ql", function() require("persistence").load({ last = true }) end)
--
-- -- stop Persistence => session won't be saved on exit
-- vim.keymap.set("n", "<leader>qd", function() require("persistence").stop() end)
--
--


-- remote-sshfs
