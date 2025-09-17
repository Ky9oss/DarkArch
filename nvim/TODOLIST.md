# 修复Bug

## 其他问题
- [x] 修复卡顿
    - fixed：用于eslint的`ale`卡飞了
- [x] redundant double quotes when creating a new line
- [x] when use }/]/) should not change the cursor to next symbol. Instead, creat a new symbol


## 窗口问题
- [x] shift + K 进入了新的文件，导致nvim-tree和minimap乱序和意外退出。

## nvim-tree bug
- [x] 退出主窗口后，由于存在其他buffer而没有正常退出(fixed: use `qa`)
- [x] bufferline多tab时，nvim-tree只高亮被选中的tab

## vim-plug bug
- [x] telescope被`PlugClean`莫名删除 (*fixed: add branch in Plug*)

## persistence bug
- [x] persistence 不同项目的状态被混用(*fixed: use alias in zsh*)

# 添加功能
- [ ] 远程LSP，实现跨平台写代码并LSP编译
- [x] 布局自动恢复
- [x] 显示当前绝对路径
- [x] minimap 自动关闭
- [x] 底标显示project名称
- [ ]

## (可选)额外功能
- [ ] 能否实现近乎于chrome的js debuger
- [ ] git历史，仿github化阅读

# 需要研究
- [ ] lspconfig 启动逻辑，为何cshrap启动有误
- [ ] Client -> LSP server -> Client 具体转发数据格式、是否预处理/后处理数据、能否直接使用TCP流

# 有用的快捷命令

- 打印当前所有buffer的名称：`:echo map(range(1, bufnr('$')), 'bufname(v:val)')`

# 远程LSP

## 方法一：手动配置
```bash
socat TCP-LISTEN:6000,reuseaddr,fork EXEC:"omnisharp.exe -lsp"
```

```lua
require'lspconfig'.omnisharp.setup{
    cmd = {"nc", "windows-host", "6000"},
    root_dir = require'lspconfig'.util.root_pattern("*.sln", "*.csproj"),
}


```

## 方法二：distant.nvim

# 调试方法
neovim内置性能分析器：
```
:profile start profile.log
:profile func *
:profile file *
" 正常操作一段时间
:profile pause
:noautocmd qall!
```
