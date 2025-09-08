const net = require('net');
const cp = require('child_process');

const server = net.createServer((socket) => {
    const lsp = cp.spawn('OmniSharp.exe', ['-lsp', '-z', '--encoding', 'utf-8']);
    socket.pipe(lsp.stdin);
    lsp.stdout.pipe(socket);
    lsp.stderr.pipe(process.stderr);
});

server.listen(5000, '127.0.0.1', () => console.log('LSP TCP server listening on 127.0.0.1:5000'));