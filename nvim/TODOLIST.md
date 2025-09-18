# 修复Bug

## distant.nvim

- [ ] buffer id error

# 添加功能
- [ ] 远程LSP
- [ ]

## (可选)额外功能
- [ ] 能否实现近乎于chrome的js debuger
- [ ] git历史，仿github化阅读

# 需要研究
- [ ] lspconfig 启动逻辑，为何cshrap启动有误
- [ ] Client -> LSP server -> Client 具体转发数据格式、是否预处理/后处理数据、能否直接使用TCP流

# 有用的快捷命令

- 打印当前所有buffer的名称：`:echo map(range(1, bufnr('$')), 'bufname(v:val)')`
- 测试远程LSP连通性：`echo -e "Content-Length: 0\r\n\r\n" | nc 127.0.0.1 5000`

# 一些坑点

## 关于LSP

> [!TIP]
> 客户端通过RPC向LSP传递配置信息、项目路径等基础信息，而不是源代码(我之前误解了)。LSP根据**项目路径**去检查解析项目结构即代码。
> 原理上，如果一个机器上没有项目文件，则不能使用LSP。所以远程LSP必须要远程同步项目文件

- LspInfo意外消失: 假如Lsp运行失败，则在LspInfo的Active Clients /Enabled Configuration 中, 都找不到对应LSP的身影，这是正常的。

