-- nvim-tree
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  update_focused_file = {
    enable = true,        -- 打开文件时自动高亮
    update_cwd = true,    -- 切换目录
  },
  renderer = {
    group_empty = true,
    highlight_git = true,
    highlight_opened_files = "name",  -- 高亮所有打开文件
    root_folder_modifier = ":t",
    icons = {
      show = {
        git = false,
        folder = true,
        file = true,
        folder_arrow = true,
      },
    },
  },
  filters = {
    dotfiles = false, -- show hidden files
  },
  actions = {
    open_file = {
      quit_on_open = false,  -- 打开文件后不关闭 tree
    },
  },
})

-- auto open nvim-tree
local function open_nvim_tree(data)

  -- buffer is a real file on the disk
  local real_file = vim.fn.filereadable(data.file) == 1

  -- buffer is a [No Name]
  local no_name = data.file == "" and vim.bo[data.buf].buftype == ""


  if real_file and not no_name then
      local dir = vim.fn.fnamemodify(data.file, ":p:h")
      vim.cmd.cd(dir)
      require("nvim-tree.api").tree.toggle({ focus = false, find_file = true, })
  elseif no_name then
      require("nvim-tree.api").tree.open()
  else
      require("nvim-tree.api").tree.open()
    -- return
  end

end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

-- auto close
vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
      vim.cmd "quit"
    end
  end
})

-- 查找和聚焦目录（with telescope）
function find_directory_and_focus()
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")

  local function open_nvim_tree(prompt_bufnr, _)
    actions.select_default:replace(function()
      local api = require("nvim-tree.api")

      actions.close(prompt_bufnr)
      local selection = action_state.get_selected_entry()
      api.tree.open()
      api.tree.find_file(selection.cwd .. "/" .. selection.value)
    end)
    return true
  end

  require("telescope.builtin").find_files({
    find_command = { "fd", "--type", "directory", "--hidden", "--exclude", ".git/*" },
    attach_mappings = open_nvim_tree,
  })
end

vim.keymap.set("n", "fd", find_directory_and_focus)
