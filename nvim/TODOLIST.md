# 修复Bug
- [x] 修复卡顿
    - 已修复：用于eslint的`ale`卡飞了，单操作2s以上，不确定为什么

- [ ] 修复bug： `shift+K`查看文档退出后，nvim-tree修改了原先的目录结构，将当前文件放到顶部。
- [ ] 修复bug：telescope被`PlugClean`莫名删除
- [ ] bufferline多tab时，nvim-tree只高亮被选中的tab

# 添加功能
- [ ] 布局自动恢复
- [ ] minimap 当只剩下nvim-tree时，自动关闭
- [ ] minimap 不要被选中（C-w + l），给一个末尾id？
- [ ] 显示当前绝对路径
- [ ] 实现类似vscode远程使用的neovim方式
- [ ] git历史，仿github化阅读
- [ ] 内置shell终端：不要重复加载shell，避免wsl拖慢程序
- [ ] 内置shell终端：不要esc退出，仅`:q`
- [ ]
- [ ]
- [ ] 能否实现近乎于chrome的js debuger


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
