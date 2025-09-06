- [x] 修复卡顿
    - 已修复：用于eslint的`ale`卡飞了，单操作2s以上，不确定为什么

- [ ] tmux Ctrl+r 恢复页面时，同时恢复neovim原目录情况
- [ ] 修复bug： `shift+K`查看文档退出后，nvim-tree修改了原先的目录结构，将当前文件放到顶部。

- [ ] minimap 当只剩下nvim-tree时，自动关闭
- [ ] minimap 不要被选中（C-w + l），给一个末尾id？
- [ ] bufferline多tab时，nvim-tree只高亮被选中的tab

- [ ] 显示当前绝对路径
- [ ] 布局自动恢复工具


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
