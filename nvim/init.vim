call plug#begin()

" List your plugins here
Plug 'jiangmiao/auto-pairs'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }

" themes
Plug 'folke/tokyonight.nvim'
" Plug 'daltonmenezes/aura-theme', { 'rtp': 'packages/neovim' }
" Plug 'tanvirtin/monokai.nvim'
" Plug 'EdenEast/nightfox.nvim'

"" Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}
Plug 'farmergreg/vim-lastplace'
Plug 'dhruvasagar/vim-table-mode'
Plug 'neovim/nvim-lspconfig'
Plug 'j-hui/fidget.nvim', { 'tag': 'v1.6.1' }
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'numToStr/Comment.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }

" avante.nvim
" Plug 'stevearc/dressing.nvim'
" Plug 'MunifTanjim/nui.nvim'
" Plug 'yetone/avante.nvim', { 'branch': 'main', 'do': 'make' }

" Completion framework
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'hrsh7th/cmp-vsnip'                             
Plug 'hrsh7th/cmp-path'                              
Plug 'hrsh7th/cmp-buffer'                            
Plug 'hrsh7th/vim-vsnip'
Plug 'voldikss/vim-floaterm'


Plug 'nvim-tree/nvim-web-devicons' "or Plug 'echasnovski/mini.icons'
Plug 'HakonHarnes/img-clip.nvim'
Plug 'zbirenbaum/copilot.lua'
Plug 'voldikss/vim-floaterm'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'm-demare/hlargs.nvim'
Plug 'danilamihailov/beacon.nvim'
Plug 'preservim/tagbar'

" markdown
Plug 'MeanderingProgrammer/render-markdown.nvim'

" mermaid
" Plug '3rd/diagram.nvim'

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

" Nerdtree
" Plug 'preservim/nerdtree'
" " Nerdtree Plugin
" "" add color for nerdtree
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" "" Nerdtree sync
" Plug 'unkiwii/vim-nerdtree-sync'

" statusline 
Plug 'itchyny/lightline.vim'

" Cursorline
Plug 'ya2s/nvim-cursorline'

" better glance at matched information
Plug 'kevinhwang91/nvim-hlslens'

" minimap
Plug 'wfxr/minimap.vim'

" highlight
" Plug 'machakann/vim-highlightedyank'

" Linter
" Plug 'dense-analysis/ale'

" editorconfig-vim
Plug 'editorconfig/editorconfig-vim'

" restrore session
" Plug 'rmagatti/auto-session'  " [Bug]: can't restore session
" Plug 'folke/persistence.nvim' " [Bug]: can't restore session


call plug#end()

" my script
" source /root/.config/nvim/vim/m0vingLine.vim
" source /root/.config/nvim/vim/n3rdTree.vim

" base config
set tabstop=4
set shiftwidth=4
set expandtab
set number
set laststatus=3
set termguicolors
set encoding=UTF-8
set noshowmode
let mapleader = "\\"

" statusline
let g:lightline = {
    \ 'enable': { 'tabline': 0 },
    \ }

" minimap
let g:minimap_width = 10
let g:minimap_auto_start = 1
let g:minimap_auto_start_win_enter = 1

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
nnoremap <leader>sh :FloatermNew --name=myfloat --height=0.8 --width=0.7 --autoclose=2 <CR>
nnoremap t :FloatermToggle myfloat<CR>
tnoremap <Esc> <C-\><C-n>:q<CR>

" telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

"bufferline
nnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
nnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
nnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
nnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
nnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
nnoremap <silent><leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
nnoremap <silent><leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
nnoremap <silent><leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
nnoremap <silent><leader>l :BufferLineCycleNext<CR>
nnoremap <silent><leader>h :BufferLineCyclePrev<CR>
nnoremap <silent><leader>k :BufferLineCloseRight<CR>
nnoremap <silent><leader>j :BufferLineCloseLeft<CR>
nnoremap <silent><leader>L :BufferLineMoveNext<CR>
nnoremap <silent><leader>H :BufferLineMovePrev<CR>

" tagbar
nmap <F8> :TagbarToggle<CR>

" avante.nvim
" autocmd! User avante.nvim 

lua << EOF
require("keys")
require("opts.opts")
require("opts.nvimTreeOpts")
-- require('avante_lib').load()
-- require('avante').setup ()
require("ibl").setup()
require('Comment').setup()
require("bufferline").setup{}
require('beacon').setup()
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
      position = "right", -- 从 "left" 改为 "right"  
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
            "bashls"
        }
    }
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


local lspconfig = require('lspconfig')
local configs = require('lspconfig.configs')

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

-- telescope gd gr gi
local ok, builtin = pcall(require, 'telescope.builtin')
if ok then
  vim.keymap.set('n', 'gd', builtin.lsp_definitions, { noremap = true, silent = true })
  vim.keymap.set('n', 'gr', builtin.lsp_references, { noremap = true, silent = true })
  vim.keymap.set('n', 'gi', builtin.lsp_implementations, { noremap = true, silent = true })
  -- vim.keymap.set('n', '<leader>ld', builtin.diagnostics, { noremap = true, silent = true })
  -- vim.keymap.set('n', '<leader>lw', builtin.lsp_workspace_diagnostics, { noremap = true, silent = true })
end


-- Completion Plugin Setup
local cmp = require'cmp'
cmp.setup({
  -- Enable LSP snippets
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
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


EOF
