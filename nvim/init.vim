call plug#begin()

" auto pair
Plug 'windwp/nvim-autopairs'
" Plug 'jiangmiao/auto-pairs'

" icon
Plug 'nvim-tree/nvim-web-devicons' "or Plug 'echasnovski/mini.icons'

" beauty tab
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }

" themes
Plug 'folke/tokyonight.nvim'
    " Plug 'daltonmenezes/aura-theme', { 'rtp': 'packages/neovim' }
    " Plug 'tanvirtin/monokai.nvim'
    " Plug 'EdenEast/nightfox.nvim'

" intelligently reopens files at your last edit position
Plug 'farmergreg/vim-lastplace'

" automatic table creator. 
Plug 'dhruvasagar/vim-table-mode'

" LSP
Plug 'neovim/nvim-lspconfig'

" LSP progress messages
Plug 'j-hui/fidget.nvim', { 'tag': 'v1.6.1' }

" indentation lines
Plug 'lukas-reineke/indent-blankline.nvim'

" Quickly add comment
Plug 'numToStr/Comment.nvim'

" Treesitter-based highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Utils: Useful lua functions 
Plug 'nvim-lua/plenary.nvim'

" \ff \fg
Plug 'nvim-telescope/telescope.nvim' , { 'branch': 'master' } ", { 'tag': '0.1.8' }

" AI plugins. Make neovim like Cursor.
    " Plug 'stevearc/dressing.nvim'
    " Plug 'MunifTanjim/nui.nvim'
    " Plug 'yetone/avante.nvim', { 'branch': 'main', 'do': 'make' }
    "
    " Use github copilot
    " Plug 'zbirenbaum/copilot.lua'

" Completion framework
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'hrsh7th/cmp-vsnip'                             
Plug 'hrsh7th/cmp-path'                              
Plug 'hrsh7th/cmp-buffer'                            
Plug 'L3MON4D3/LuaSnip' 
Plug 'saadparwaiz1/cmp_luasnip'


" floating window
Plug 'voldikss/vim-floaterm'

" heilight function's args with treesitter
Plug 'm-demare/hlargs.nvim'

" flash when cursor jumps
Plug 'danilamihailov/beacon.nvim'

" F8 show the outline
Plug 'preservim/tagbar'

" markdown
Plug 'MeanderingProgrammer/render-markdown.nvim'

" mason
Plug 'mason-org/mason.nvim'
Plug 'mason-org/mason-lspconfig.nvim'

" Debuger
" Plug 'puremourning/vimspector'
Plug 'mfussenegger/nvim-dap'
Plug 'nvim-neotest/nvim-nio'
Plug 'rcarriga/nvim-dap-ui'

" smart split
Plug 'mrjones2014/smart-splits.nvim'

" icon
Plug 'ryanoasis/vim-devicons'

" nvim-tree
Plug 'nvim-tree/nvim-tree.lua'

" statusline 
Plug 'itchyny/lightline.vim'

" Cursorline
Plug 'ya2s/nvim-cursorline'

" better glance at matched information
Plug 'kevinhwang91/nvim-hlslens'

" Linter
" Plug 'dense-analysis/ale'

" editorconfig-vim
Plug 'editorconfig/editorconfig-vim'

" restrore session
" Plug 'rmagatti/auto-session'  " [Bug]: can't restore session

" omnisharp enhancement
Plug 'Hoffs/omnisharp-extended-lsp.nvim'

" relative line number
Plug 'sitiom/nvim-numbertoggle'

" Interactive Repls
Plug 'Vigemus/iron.nvim'

" Persistence session
" Plug 'olimorris/persisted.nvim'
" Plug 'jedrzejboczar/possession.nvim'
Plug 'folke/persistence.nvim'

" colorful window line
Plug 'nvim-zh/colorful-winsep.nvim'

" tmux
Plug 'aserowy/tmux.nvim'

" Improve LSP
Plug 'nvimdev/lspsaga.nvim'

" fold
Plug 'kevinhwang91/promise-async'
Plug 'kevinhwang91/nvim-ufo'

" Scroll bar
Plug 'petertriho/nvim-scrollbar'

" Project Management
Plug 'ahmedkhalf/project.nvim'

" Remote Dev
Plug 'chipsenkbeil/distant.nvim', { 'branch': 'v0.3' }

call plug#end()

" my script
" source /root/.config/nvim/vim/m0vingLine.vim
" source /root/.config/nvim/vim/n3rdTree.vim

" base config
" set tabstop=4
" set shiftwidth=4
set expandtab
set number
set laststatus=3
set termguicolors
set encoding=UTF-8
set noshowmode
set undodir=~/.local/share/nvim/
let mapleader = "\\"


" minimap
" let g:minimap_width = 10
" let g:minimap_auto_start = 1
" let g:minimap_auto_start_win_enter = 1

" ale: Enable ESLint only for JavaScript.
" let b:ale_linters = ['eslint']

" set clipboard=unnamedplus
set clipboard=
nnoremap y "+y
nnoremap Y "+Y
vnoremap y "+y
vnoremap Y "+Y

" theme
colorscheme tokyonight-night
" colorscheme nightfox
" colorscheme aura-dark

" FloaTerm configuration
nnoremap <leader>nsh :FloatermNew --name=myfloat --height=0.8 --width=0.7 --autoclose=2 <CR>
tnoremap <Esc> <C-\><C-n>:q<CR>

" telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep <cr>
nnoremap <leader>fb <cmd>Telescope buffers <cr>
nnoremap <leader>fh <cmd>Telescope help_tags <cr>

"bufferline
nnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
nnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
nnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
nnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
nnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
nnoremap <silent><leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
nnoremap <silent><leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
nnoremap <silent><leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
nnoremap <silent> BN :BufferLineMoveNext<CR>
nnoremap <silent> BP :BufferLineMovePrev<CR>
nnoremap <silent><leader>cr :BufferLineCloseRight<CR>
nnoremap <silent><leader>cl :BufferLineCloseLeft<CR>
nnoremap <silent><C-n> :BufferLineCycleNext<CR>
nnoremap <silent><C-p> :BufferLineCyclePrev<CR>

" tagbar
nmap <F8> :TagbarToggle<CR>



lua << EOF
require("opts.opts")
require("opts.nvim-tree")
require("opts.nvim-scrollbar")
require("opts.telescope")
require("custom-quit")
require("check-enviroment")
require("toggle-floaterm")
local lspconfig = require('lspconfig')
local configs = require('lspconfig.configs')



-- plugin:setup({
--     servers = {
--         ['*'] = {
--             lsp = {
--                 ['windows_omnisharp'] = {
--                     cmd = 'OmniSharp.exe -lsp -z --hostPID 12345 --encoding utf-8 -z',
--                     -- cmd = 'OmniSharp.exe -lsp -z --encoding utf-8 -z',
--                     root_dir = lspconfig.util.root_pattern(".csproj", vim.fn.getcwd()),
--                     file_types = {'cs', 'vb'},
--                     on_exit = function(code, signal, client_id)
--                         local prefix = '[Client ' .. tostring(client_id) .. ']'
--                         print(prefix .. ' LSP exited with code ' .. tostring(code))
--
--                         -- Signal can be nil
--                         if signal ~= nil then
--                             print(prefix .. ' Signal ' .. tostring(signal))
--                         end
--                     end,
--                 }
--             }
--         }
--     }
-- })


vim.o.foldcolumn = '0' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
vim.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds)
vim.keymap.set('n', 'zm', require('ufo').closeFoldsWith)

require('ufo').setup({
    fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
        local newVirtText = {}
        local suffix = (' 󰁂 %d '):format(endLnum - lnum)
        local sufWidth = vim.fn.strdisplaywidth(suffix)
        local targetWidth = width - sufWidth
        local curWidth = 0
        for _, chunk in ipairs(virtText) do
            local chunkText = chunk[1]
            local chunkWidth = vim.fn.strdisplaywidth(chunkText)
            if targetWidth > curWidth + chunkWidth then
                table.insert(newVirtText, chunk)
            else
                chunkText = truncate(chunkText, targetWidth - curWidth)
                local hlGroup = chunk[2]
                table.insert(newVirtText, {chunkText, hlGroup})
                chunkWidth = vim.fn.strdisplaywidth(chunkText)
                -- str width returned from truncate() may less than 2nd argument, need padding
                if curWidth + chunkWidth < targetWidth then
                    suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
                end
                break
            end
            curWidth = curWidth + chunkWidth
        end
        table.insert(newVirtText, {suffix, 'MoreMsg'})
        return newVirtText
    end,
    provider_selector = function(bufnr, filetype, buftype)
        return {'treesitter', 'indent'}
    end
})

require('lspsaga').setup({})

-- project
require("project_nvim").setup {
  detection_methods = { "lsp", "pattern" },
  patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", ".editorconfig" },
}
require('telescope').load_extension('projects')
vim.keymap.set('n', '<leader>fp', function()
  require('telescope').extensions.projects.projects()
end, { noremap = true, silent = true, desc = "Find Projects" })

require("nvim-autopairs").setup {}
require("ibl").setup()
require("tmux").setup()
require('colorful-winsep').setup()
require('Comment').setup()
require('beacon').setup()
require("distant"):setup()
require("dapui").setup({
  layouts = {  
    {  
      elements = {  
        { id = "scopes", size = 0.25 },  
        { id = "breakpoints", size = 0.25 },  
        { id = "stacks", size = 0.25 },  
        { id = "watches", size = 0.25 },  
      },  
      size = 40,  
      position = "right",
    },  
    {  
      elements = {  
        "repl",  
        "console",  
      },  
      size = 10,  
      position = "bottom",  
    },  
  },
})
require('nvim-cursorline').setup {
  cursorline = {
    enable = true,
    timeout = 1000,
    number = false,
  },
  cursorword = {
    enable = true,
    min_length = 3,
    hl = { underline = true },
  }
}
require('render-markdown').setup()
require("mason").setup({
    ui = {
        icons = {
            package_installed = "",
            package_pending = "",
            package_uninstalled = "",
        },
    }
})
require("mason-lspconfig").setup {
    automatic_enable = {
        exclude = {
            "rust-analyzer",
            "pylsp",
            "bashls",
            "lua_ls",
            -- "omnisharp",
        }
    },
}


-- lspconfig
require('lspconfig').rust_analyzer.setup{
    settings = {
        ["rust-analyzer"] = {
            cargo = {
                allFeatures = true
            },
            procMacro = {
                enable = true
            }
		}
	}
}

-- omnisharp
local lspconfig = require("lspconfig")
local configs = require("lspconfig.configs")
local util = require("lspconfig/util")

if not configs.omnisharp_remote then
  configs.omnisharp_remote = {
    default_config = {
      cmd = { "nc", "127.0.0.1", "5000" },  -- 直连远程
      filetypes = { "cs", "vb" },
      root_dir = util.root_pattern(".git", "*.sln", "*.csproj"),
      single_file_support = true,
    },
  }
end

lspconfig.omnisharp_remote.setup {
  on_attach = function(client, bufnr)
    print("✅ attached to omnisharp_remote on buffer " .. bufnr)
  end,
}



lspconfig.omnisharp_remote.setup {}
require("lspconfig").pylsp.setup({
  cmd = { "pylsp" },
  on_new_config = function(new_config, root_dir)
    -- 自动用当前 pyenv 激活的 python
    local python_path = vim.fn.systemlist("pyenv which python")[1]
    if vim.fn.filereadable(python_path) == 1 then
      new_config.settings.pylsp.configurationSources = { "pycodestyle" }
      new_config.settings.pylsp.plugins.jedi = { environment = python_path }
    end
  end,
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = { enabled = false },
        mccabe = { enabled = false },
        mypy = { enabled = true },
      },
    },
  },
})

local runtime_path = vim.api.nvim_get_runtime_file("", true)  -- 返回 runtimepath 下所有文件
local library = {}
for _, path in ipairs(runtime_path) do
  library[path] = true
end
require("lspconfig").lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT", 
        path = vim.split(package.path, ";"),
      },
      diagnostics = {
        globals = { "vim" }, -- 避免 'vim' 未定义警告
      },
      workspace = {
        library = library,
      },
      telemetry = { enable = false },
    },
  },
}


-- 如果没注册过 asm_lsp，则注册
if not configs.asm_lsp then
  configs.asm_lsp = {
    default_config = {
      cmd = { "asm-lsp" },
      filetypes = { "asm", "s", "S" },
      root_dir = lspconfig.util.root_pattern(".git", vim.fn.getcwd()),
      settings = {
        default_config = {
          assembler = "gas",
          instruction_set = "x86/x86-64",
        },
        opts = {
          compiler = "gcc",
          diagnostics = true,
          default_diagnostics = true,
        },
      },
    },
  }
end

require('lspconfig').asm_lsp.setup({})
require('lspconfig').bashls.setup {
    cmd = { "bash-language-server", "start" },
    filetypes = { 'bash', 'sh' }
}

require('smart-splits').setup({
  -- Ignored buffer types (only while resizing)
  ignored_buftypes = {
    'nofile',
    'quickfix',
    'prompt',
  },
  -- Ignored filetypes (only while resizing)
  ignored_filetypes = { 'NvimTree' },
  -- the default number of lines/columns to resize by at a time
  default_amount = 3,
  -- Desired behavior when your cursor is at an edge and you
  -- are moving towards that same edge:
  -- 'wrap' => Wrap to opposite side
  -- 'split' => Create a new split in the desired direction
  -- 'stop' => Do nothing
  -- function => You handle the behavior yourself
  -- NOTE: If using a function, the function will be called with
  -- a context object with the following fields:
  -- {
  --    mux = {
  --      type:'tmux'|'wezterm'|'kitty'|'zellij'
  --      current_pane_id():number,
  --      is_in_session(): boolean
  --      current_pane_is_zoomed():boolean,
  --      -- following methods return a boolean to indicate success or failure
  --      current_pane_at_edge(direction:'left'|'right'|'up'|'down'):boolean
  --      next_pane(direction:'left'|'right'|'up'|'down'):boolean
  --      resize_pane(direction:'left'|'right'|'up'|'down'):boolean
  --      split_pane(direction:'left'|'right'|'up'|'down',size:number|nil):boolean
  --    },
  --    direction = 'left'|'right'|'up'|'down',
  --    split(), -- utility function to split current Neovim pane in the current direction
  --    wrap(), -- utility function to wrap to opposite Neovim pane
  -- }
  -- NOTE: `at_edge = 'wrap'` is not supported on Kitty terminal
  -- multiplexer, as there is no way to determine layout via the CLI
  at_edge = 'wrap',
  -- Desired behavior when the current window is floating:
  -- 'previous' => Focus previous Vim window and perform action
  -- 'mux' => Always forward action to multiplexer
  float_win_behavior = 'previous',
  -- when moving cursor between splits left or right,
  -- place the cursor on the same row of the *screen*
  -- regardless of line numbers. False by default.
  -- Can be overridden via function parameter, see Usage.
  move_cursor_same_row = false,
  -- whether the cursor should follow the buffer when swapping
  -- buffers by default; it can also be controlled by passing
  -- `{ move_cursor = true }` or `{ move_cursor = false }`
  -- when calling the Lua function.
  cursor_follows_swapped_bufs = false,
  -- ignore these autocmd events (via :h eventignore) while processing
  -- smart-splits.nvim computations, which involve visiting different
  -- buffers and windows. These events will be ignored during processing,
  -- and un-ignored on completed. This only applies to resize events,
  -- not cursor movement events.
  ignored_events = {
    'BufEnter',
    'WinEnter',
  },
  -- enable or disable a multiplexer integration;
  -- automatically determined, unless explicitly disabled or set,
  -- by checking the $TERM_PROGRAM environment variable,
  -- and the $KITTY_LISTEN_ON environment variable for Kitty.
  -- You can also set this value by setting `vim.g.smart_splits_multiplexer_integration`
  -- before the plugin is loaded (e.g. for lazy environments).
  multiplexer_integration = nil,
  -- disable multiplexer navigation if current multiplexer pane is zoomed
  -- NOTE: This does not work on Zellij as there is no way to determine the
  -- pane zoom state outside of the Zellij Plugin API, which does not apply here
  disable_multiplexer_nav_when_zoomed = true,
  -- Supply a Kitty remote control password if needed,
  -- or you can also set vim.g.smart_splits_kitty_password
  -- see https://sw.kovidgoyal.net/kitty/conf/#opt-kitty.remote_control_password
  kitty_password = nil,
  -- In Zellij, set this to true if you would like to move to the next *tab*
  -- when the current pane is at the edge of the zellij tab/window
  zellij_move_focus_or_tab = false,
  -- default logging level, one of: 'trace'|'debug'|'info'|'warn'|'error'|'fatal'
  log_level = 'info',
})

require("fidget").setup {
  -- Options related to LSP progress subsystem
  progress = {
    poll_rate = 0,                -- How and when to poll for progress messages
    suppress_on_insert = false,   -- Suppress new messages while in insert mode
    ignore_done_already = false,  -- Ignore new tasks that are already complete
    ignore_empty_message = false, -- Ignore new tasks that don't contain a message
    clear_on_detach =             -- Clear notification group when LSP server detaches
      function(client_id)
        local client = vim.lsp.get_client_by_id(client_id)
        return client and client.name or nil
      end,
    notification_group =          -- How to get a progress message's notification group key
      function(msg) return msg.lsp_client.name end,
    ignore = {},                  -- List of LSP servers to ignore

    -- Options related to how LSP progress messages are displayed as notifications
    display = {
      render_limit = 16,          -- How many LSP messages to show at once
      done_ttl = 3,               -- How long a message should persist after completion
      done_icon = "✔",            -- Icon shown when all LSP progress tasks are complete
      done_style = "Constant",    -- Highlight group for completed LSP tasks
      progress_ttl = math.huge,   -- How long a message should persist when in progress
      progress_icon =             -- Icon shown when LSP progress tasks are in progress
        { "dots" },
      progress_style =            -- Highlight group for in-progress LSP tasks
        "WarningMsg",
      group_style = "Title",      -- Highlight group for group name (LSP server name)
      icon_style = "Question",    -- Highlight group for group icons
      priority = 30,              -- Ordering priority for LSP notification group
      skip_history = true,        -- Whether progress notifications should be omitted from history
      format_message =            -- How to format a progress message
        require("fidget.progress.display").default_format_message,
      format_annote =             -- How to format a progress annotation
        function(msg) return msg.title end,
      format_group_name =         -- How to format a progress notification group's name
        function(group) return tostring(group) end,
      overrides = {               -- Override options from the default notification config
        rust_analyzer = { name = "rust-analyzer" },
      },
    },

    -- Options related to Neovim's built-in LSP client
    lsp = {
      progress_ringbuf_size = 0,  -- Configure the nvim's LSP progress ring buffer size
      log_handler = false,        -- Log `$/progress` handler invocations (for debugging)
    },
  },

  -- Options related to notification subsystem
  notification = {
    poll_rate = 10,               -- How frequently to update and render notifications
    filter = vim.log.levels.INFO, -- Minimum notifications level
    history_size = 128,           -- Number of removed messages to retain in history
    override_vim_notify = false,  -- Automatically override vim.notify() with Fidget
    configs =                     -- How to configure notification groups when instantiated
      { default = require("fidget.notification").default_config },
    redirect =                    -- Conditionally redirect notifications to another backend
      function(msg, level, opts)
        if opts and opts.on_open then
          return require("fidget.integration.nvim-notify").delegate(msg, level, opts)
        end
      end,

    -- Options related to how notifications are rendered as text
    view = {
      stack_upwards = true,       -- Display notification items from bottom to top
      icon_separator = " ",       -- Separator between group name and icon
      group_separator = "---",    -- Separator between notification groups
      group_separator_hl =        -- Highlight group used for group separator
        "Comment",
      render_message =            -- How to render notification messages
        function(msg, cnt)
          return cnt == 1 and msg or string.format("(%dx) %s", cnt, msg)
        end,
    },

    -- Options related to the notification window and buffer
    window = {
      normal_hl = "Comment",      -- Base highlight group in the notification window
      winblend = 100,             -- Background color opacity in the notification window
      border = "none",            -- Border around the notification window
      zindex = 45,                -- Stacking priority of the notification window
      max_width = 0,              -- Maximum width of the notification window
      max_height = 0,             -- Maximum height of the notification window
      x_padding = 1,              -- Padding from right edge of window boundary
      y_padding = 0,              -- Padding from bottom edge of window boundary
      align = "bottom",           -- How to align the notification window
      relative = "editor",        -- What the notification window position is relative to
    },
  },

  -- Options related to integrating with other plugins
  integration = {
    ["nvim-tree"] = {
      enable = true,              -- Integrate with nvim-tree/nvim-tree.lua (if installed)
    },
    ["xcodebuild-nvim"] = {
      enable = true,              -- Integrate with wojciech-kulik/xcodebuild.nvim (if installed)
    },
  },

  -- Options related to logging
  logger = {
    level = vim.log.levels.WARN,  -- Minimum logging level
    max_size = 10000,             -- Maximum log file size, in KB
    float_precision = 0.01,       -- Limit the number of decimals displayed for floats
    path =                        -- Where Fidget writes its logs to
      string.format("%s/fidget.nvim.log", vim.fn.stdpath("cache")),
  },
}


require('telescope').setup{
  defaults = {
    layout_config = {  
      width = 0.8,  
      height = 0.9,  
      preview_width = 0.7,
      -- anchor = "CENTER", 
      -- anchor_padding = -25,  -- 负值向上调整
      -- 保留 dropdown 主题的其他默认设置  
    },  
    preview = {
      wrap = true,  -- 自动换行
    },
    mappings = {
      i = {
        ["<C-e>"] = require('telescope.actions').preview_scrolling_left,
        ["<C-t>"] = require('telescope.actions').preview_scrolling_right,
        ["<C-b>"] = require('telescope.actions').preview_scrolling_up,  -- 整页也可绑定
        ["<C-f>"] = require('telescope.actions').preview_scrolling_down,
      },
      n = {
        ["<C-e>"] = require('telescope.actions').preview_scrolling_left,
        ["<C-t>"] = require('telescope.actions').preview_scrolling_right,
        ["<C-b>"] = require('telescope.actions').preview_scrolling_up,  -- 整页也可绑定
        ["<C-f>"] = require('telescope.actions').preview_scrolling_down,
      },
    },
  },
}

-- telescope gd gr gi
local ok, builtin = pcall(require, 'telescope.builtin')
if ok then
  vim.keymap.set('n', 'gd', builtin.lsp_definitions, { noremap = true, silent = true })
  vim.keymap.set('n', 'gr', builtin.lsp_references, { noremap = true, silent = true })
  vim.keymap.set('n', 'gi', builtin.lsp_implementations, { noremap = true, silent = true })
  -- vim.keymap.set('n', 'K', builtin.lsp_references, { noremap = true, silent = true })
  -- vim.keymap.set('n', '<leader>ld', builtin.diagnostics, { noremap = true, silent = true })
  -- vim.keymap.set('n', '<leader>lw', builtin.lsp_workspace_diagnostics, { noremap = true, silent = true })
end


-- Completion Plugin Setup
local cmp = require'cmp'
cmp.setup({
  -- Enable LSP snippets
  snippet = {
    expand = function(args)
        require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Add tab support
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-S-f>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },
  -- Installed sources:
  sources = {
    { name = 'path' },                              -- file paths
    { name = 'nvim_lsp', keyword_length = 3 },      -- from language server
    { name = 'nvim_lsp_signature_help'},            -- display function signatures with current parameter emphasized
    { name = 'nvim_lua', keyword_length = 2},       -- complete neovim's Lua runtime API such vim.lsp.*
    { name = 'buffer', keyword_length = 2 },        -- source current buffer
    { name = 'vsnip', keyword_length = 2 },         -- nvim-cmp source for vim-vsnip 
    { name = 'calc'},                               -- source for math calculation
  },
  window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
  },
  formatting = {
      fields = {'menu', 'abbr', 'kind'},
      format = function(entry, item)
          local menu_icon ={
              nvim_lsp = 'λ',
              vsnip = '⋗',
              buffer = 'Ω',
              path = '🖫',
          }
          item.menu = menu_icon[entry.source.name]
          return item
      end,
  },
})


-- Treesitter Plugin Setup 
require('nvim-treesitter.configs').setup {
  ensure_installed = { "lua", "rust", "toml", "python"},
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting=false,
  },
  ident = { enable = true }, 
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  }
}

-- nvim-dap setup: open and close automatically
local dap, dapui = require("dap"), require("dapui")
dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end


-- dap for c/c++/rust
local dap = require('dap')
dap.adapters.codelldb = {
  type = "executable",
  command = "codelldb", -- or if not in $PATH: "/absolute/path/to/codelldb"

  -- On windows you may have to uncomment this:
  -- detached = false,
}
dap.configurations.c= {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}


-- dap for bash
dap.adapters.bashdb = {
  type = 'executable';
  command = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/bash-debug-adapter';
  name = 'bashdb';
}

dap.configurations.sh = {
  {
    type = 'bashdb',
    request = 'launch',
    name = "Launch file",
    showDebugOutput = true,
    pathBashdb = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/extension/bashdb_dir/bashdb',
    pathBashdbLib = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/extension/bashdb_dir',
    trace = true,
    file = "${file}",
    program = "${file}",
    cwd = '${workspaceFolder}',
    pathCat = "cat",
    pathBash = "/bin/bash",
    pathMkfifo = "mkfifo",
    pathPkill = "pkill",
    args = {},
    argsString = '',
    env = {},
    terminalKind = "integrated",
  }
}


-- dap for dotnet
-- dap.adapters.coreclr = {
--   type = 'executable',
--   command = '/path/to/dotnet/netcoredbg/netcoredbg',
--   args = {'--interpreter=vscode'}
-- }
dap.configurations.cs = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
        return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
    end,
  },
}



-- dap for php
-- dap.adapters.php = {
--   type = 'executable',
--   command = 'node',
--   args = { '/path/to/vscode-php-debug/out/phpDebug.js' }
-- }

dap.configurations.php = {
  {
    type = 'php',
    request = 'launch',
    name = 'Listen for Xdebug',
    port = 9003
  }
}



-- dap for python
dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = 'launch';
    name = "Launch file";

    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

    program = "${file}"; -- This configuration will launch the current file if used.
    pythonPath = function()
      -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
      -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
      -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
        return cwd .. '/venv/bin/python'
      elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
        return cwd .. '/.venv/bin/python'
      else
        return '/usr/bin/python'
      end
    end;
  },
}


local bufferline = require('bufferline')
bufferline.setup {
    options = {
        tab_size = 8,
    }
}



require('hlslens').setup()

local kopts = {noremap = true, silent = true}

vim.api.nvim_set_keymap('n', 'n',
    [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
    kopts)
vim.api.nvim_set_keymap('n', 'N',
    [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
    kopts)
vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)

vim.api.nvim_set_keymap('n', '<Leader>l', '<Cmd>noh<CR>', kopts)

local iron = require("iron.core")
local view = require("iron.view")
local common = require("iron.fts.common")

iron.setup {
  config = {
    -- Whether a repl should be discarded or not
    scratch_repl = true,
    -- Your repl definitions come here
    repl_definition = {
      sh = {
        -- Can be a table or a function that
        -- returns a table (see below)
        command = {"zsh"}
      },
      python = {
        command = { "python3" },  -- or { "ipython", "--no-autoindent" }
        format = common.bracketed_paste_python,
        block_dividers = { "# %%", "#%%" },
        env = {PYTHON_BASIC_REPL = "1"} --this is needed for python3.13 and up.
      },
      lua = {
        command = { "luajit" },  -- or { "ipython", "--no-autoindent" }
      }
    },
    -- set the file type of the newly created repl to ft
    -- bufnr is the buffer id of the REPL and ft is the filetype of the 
    -- language being used for the REPL. 
    repl_filetype = function(bufnr, ft)
      return ft
      -- or return a string name such as the following
      -- return "iron"
    end,
    -- How the repl window will be displayed
    -- See below for more information
    repl_open_cmd = view.bottom(10),

    -- repl_open_cmd can also be an array-style table so that multiple 
    -- repl_open_commands can be given.
    -- When repl_open_cmd is given as a table, the first command given will
    -- be the command that `IronRepl` initially toggles.
    -- Moreover, when repl_open_cmd is a table, each key will automatically
    -- be available as a keymap (see `keymaps` below) with the names 
    -- toggle_repl_with_cmd_1, ..., toggle_repl_with_cmd_k
    -- For example,
    -- 
    -- repl_open_cmd = {
    --   view.split.vertical.rightbelow("%40"), -- cmd_1: open a repl to the right
    --   view.split.rightbelow("%25")  -- cmd_2: open a repl below
    -- }

  },
  -- Iron doesn't set keymaps by default anymore.
  -- You can set them here or manually add keymaps to the functions in iron.core
  keymaps = {
    toggle_repl = "<space>rr", -- toggles the repl open and closed.
    -- If repl_open_command is a table as above, then the following keymaps are
    -- available
    -- toggle_repl_with_cmd_1 = "<space>rv",
    -- toggle_repl_with_cmd_2 = "<space>rh",
    restart_repl = "<space>rR", -- calls `IronRestart` to restart the repl
    send_motion = "<space>sc",
    visual_send = "<space>sc",
    send_file = "<space>sf",
    send_line = "<space>sl",
    send_paragraph = "<space>sp",
    send_until_cursor = "<space>su",
    send_mark = "<space>sm",
    send_code_block = "<space>sb",
    send_code_block_and_move = "<space>sn",
    mark_motion = "<space>mc",
    mark_visual = "<space>mc",
    remove_mark = "<space>md",
    cr = "<space>s<cr>",
    interrupt = "<space>s<space>",
    exit = "<space>sq",
    clear = "<space>cl",
  },
  -- If the highlight is on, you can change how it looks
  -- For the available options, check nvim_set_hl
  highlight = {
    italic = true
  },
  ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
}

-- iron also has a list of commands, see :h iron-commands for all available commands
vim.keymap.set('n', '<space>rf', '<cmd>IronFocus<cr>')
vim.keymap.set('n', '<space>rh', '<cmd>IronHide<cr>')

-- persistence setup
require('persistence').setup{

  dir = vim.fn.stdpath("state") .. "/sessions/", -- directory where session files are saved
  -- minimum number of file buffers that need to be open to save
  -- Set to 0 to always save
  need = 1,
  branch = true, -- use git branch to save session

}
-- load the session for the current directory
vim.keymap.set("n", "<leader>qs", function() require("persistence").save() end)
-- select a session to load
vim.keymap.set("n", "<leader>qS", function() require("persistence").select() end)
-- load the last session
vim.keymap.set("n", "<leader>ql", function() require("persistence").load() end)
-- stop Persistence => session won't be saved on exit
vim.keymap.set("n", "<leader>qd", function() require("persistence").stop() end)
-- auto repair nvim-tree after loading the last session
vim.api.nvim_create_autocmd("User", {
  pattern = "PersistenceLoadPost",
  callback = function()
    require("nvim-tree.api").tree.open()
  end,
})

-- statusline
local project = require("project_nvim.project") 
local project_root_path = project.get_project_root() 
local project_name = ""

if project_root_path == nil then
  project_root_path = ""
else
  project_name = "[ " .. project_root_path:match("([^/\\]+)$"):upper() .. " ]"
end

vim.g.lightline = {
  active = {
    left = {
      { "mode", "paste" },
      { "readonly", "project_name", "filename", "modified" },
    },
    right = {
      { "lineinfo" },
      { "percent" },
      { "project", "fileformat", "fileencoding", "filetype"}

    }
  },
  component = {
    project = project_root_path,
    project_name = project_name,
  },
  enable = {
    tabline = 0,
  },
}


-- luasnip
local ls = require("luasnip")
require("luasnip.loaders.from_snipmate").lazy_load({ paths = { "~/.config/nvim/snippets" } })
vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-H>", function() ls.jump(-1) end, {silent = true})

vim.keymap.set({"i", "s"}, "<C-J>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})


require("keys")

EOF
