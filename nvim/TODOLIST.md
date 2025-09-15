# 修复Bug
- [x] 修复卡顿
    - 已修复：用于eslint的`ale`卡飞了，单操作2s以上，不确定为什么

- [ ] fix bug： `shift+K`查看文档退出后，nvim-tree修改了原先的目录结构，将当前文件放到顶部。
- [ ] fix bug：telescope被`PlugClean`莫名删除
- [ ] bufferline多tab时，nvim-tree只高亮被选中的tab
- [ ] redundant double quotes when creating a new line
- [ ] when use }/]/) should not change the cursor to next symbol and not creat a new symbel
- [ ] layout fault: minimap got too much layout
- [ ] fix bug: nvim-tree 没有固定根目录，而是随着文件的变动随意跳跃

# 添加功能
- [ ] LSP Omnisharp 远程调用
- [ ] 布局自动恢复
- [ ] minimap 当只剩下nvim-tree时，自动关闭
- [ ] minimap 不要被选中（C-w + l），给一个末尾id？
- [ ] 显示当前绝对路径
- [ ] 实现类似vscode远程使用的neovim方式
- [ ] git历史，仿github化阅读
- [ ] 内置shell终端：不要重复加载shell，避免wsl拖慢程序
- [ ] 内置shell终端：不要esc退出，仅`:q`
- [ ] 远程LSP，实现跨平台写代码并LSP编译
- [ ]
- [ ] 能否实现近乎于chrome的js debuger

# 需要研究
- [ ] lspconfig 启动逻辑，为何cshrap启动有误
- [ ] Client -> LSP server -> Client 具体转发数据格式、是否预处理/后处理数据、能否直接使用TCP流

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
