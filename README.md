# Dark Arch: 打造最强开发环境
![](img/main.png)
![](img/index.png)
> [!IMPORTANT] 
> 本仓库仅记录具体安装命令，用于个人快速搭建环境，不涉及任何插件二开细节、工具原理、使用方式等解释，请自行辨别。

# 项目环境

- linux kitty || windows terminal
- wsl2 with arch linux
- debian 13
- zsh && ohmyzsh
- tmux && ohmytmux
- neovim

# 安装wsl2
1. 安装`archlinux-xxx.wsl`文件：[https://mirrors.aliyun.com/archlinux/wsl/latest/?spm=a2c6h.25603864.0.0.3b896e31D6YFPc]
2. `wsl --install --from-file xxx.wsl`安装Arch

# Arch基本配置
1. 添加国内镜像：`sh -c 'echo -e "Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/\$repo/os/\$arch\nServer = https://mirrors.aliyun.com/archlinux/\$repo/os/\$arch\nServer = https://mirrors.ustc.edu.cn/archlinux/\$repo/os/\$arch\nServer = https://mirror.sjtu.edu.cn/archlinux/\$repo/os/\$arch" > /etc/pacman.d/mirrorlist'`
2. 更新系统：`pacman -Syu`
3. update repo: `pacman -Syy`
3. 安装基本工具：`pacman -S --needed base-devel git curl wget unzip zip gdb lib32-glibc lib32-gcc-libs net-tools openssh`
4. 安装常用工具：`pacman -S zsh fzf ripgrep rsync fd jq bat vim neovim tmux proxychains-ng zoxide fontconfig nodejs universal-ctags nodejs npm`
5. 安装插件工具：`cargo install --locked code-minimap`
6. `proxychains`添加代理：`nvim /etc/proxychains.conf`
7. 安装`ohmyzsh`:`proxychains sh -c "$(proxychains curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
8. 修改`.zshrc`文件（参考该项目的`.zshrc`）
9. 修改`/etc/locale.gen`，解注释：`en_US.UTF-8 UTF-8`, 运行`locale-gen`  

### 开启`github`权限

```bash
git config --global credential.helper store
git config --system credential.helper store

# 从Github 获取Access Token，开启repo权限
# git push时，要求填写密码。密码填写为Acsess Token即可
```

### 安装NerdFont字体
> 以下为linux安装方式。如果使用wsl，请直接在windows terminal上安装字体
1. 克隆库 `proxychains git clone https://github.com/ryanoasis/nerd-fonts`
2. 安装字体: `cd nerd-fonts && chmod +x ./install.sh && ./install.sh Hack`
3. 刷新: `fc-cache -fv`

### （可选）安装paru
```sh
# 创建新用户
useradd -m builduser
passwd builduser

# 添加用户到sudoer
usermod -aG wheel builduser
visudo # 去掉注释 %wheel ALL=(ALL:ALL) ALL
su builduser
cd

# 安装环境
proxychains curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# 安装paru
proxychains git clone https://aur.archlinux.org/paru.git
cd paru
proxychains makepkg -s
su root
pacman -U /home/builduser/paru/paru-2.1.0-1-x86_64.pkg.tar.zst
```


# Tmux 配置
1. 安装`tpm`：`proxychains git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
2. 安装`oh-my-tmux`，随后修改`~/.config/tmux/tmux.conf.local`,参考项目文件`tmux.conf.local`
```sh
$ git clone --single-branch https://github.com/gpakosz/.tmux.git "/path/to/oh-my-tmux"
$ mkdir -p ~/.config/tmux
$ ln -s /path/to/oh-my-tmux/.tmux.conf ~/.config/tmux/tmux.conf
$ cp /path/to/oh-my-tmux/.tmux.conf.local ~/.config/tmux/tmux.conf.local
```
3. 在`~/.config/tmux/tmux.conf.local`中, 修改以下三个配置为`true`
```conf
tmux_conf_update_plugins_on_launch=true
tmux_conf_update_plugins_on_reload=true
tmux_conf_uninstall_plugins_on_reload=true
```
4. 开启全局代理进入`tmux`,自动安装插件

### 常见错误
1. 由于代理问题，oh-my-tmux使用tpm自动安装插件可能会失败。
#### 解决方法
在`~/.config/tmux/tmux.conf.local`中, 修改以下三个配置为`false`
```conf
tmux_conf_update_plugins_on_launch=false
tmux_conf_update_plugins_on_reload=false
tmux_conf_uninstall_plugins_on_reload=false
```

在`~/.tmux/plugins`目录下，执行：
```bash
proxychains git clone 'https://github.com/tmux-plugins/tmux-copycat'
proxychains git clone 'https://github.com/tmux-plugins/tmux-cpu'
proxychains git clone 'https://github.com/tmux-plugins/tmux-resurrect'
proxychains git clone 'https://github.com/aserowy/tmux.nvim'
```


# Neovim 配置
1. 安装`vim-plug`：`proxychains curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`
2. 将其他`nvim/`下所有文件复制至`~/.config/nvim/`文件夹中
3. 重启nvim并使用`:PlugInstall`安装插件
4. 安装`nvim-lspconfig`:`proxychains git clone https://github.com/neovim/nvim-lspconfig ~/.config/nvim/pack/nvim/start/nvim-lspconfig`

### Neovim-markdowss
1. `MasonInstall marksman`

### Neovim-rust
1. 使用`mason`安装：`:MasonInstall rust-analyzer codelldb`

### Neovim-python
1. install pyenv: `proxychains curl -fsSL https://pyenv.run | proxychains bash`
2. add pyenv startup env: 
```sh
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init - zsh)"' >> ~/.zshrc
```
3. `source ~/.zshrc`
4. `proxychains pyenv install 3.13.6`
5. `pyenv global 3.13.6`
6. mason install lsp: `:MasonInstall mypy debugpy python-lsp-server`

### Neovim-lua
1. mason install lsp: `:MasonInstall lua-language-server`

### Neovim-asm
1. `proxychains wget --secure-protocol=tlsv1_2 --no-check-certificate https://github.com/bergercookie/asm-lsp/releases/download/v0.10.0/asm-lsp-x86_64-unknown-linux-gnu.tar.gz`
2. `tar -zxvf asm-lsp-x86_64-unknown-linux-gnu.tar.gz`
3. add asm-lsp in $PATH

### Neovim-java
1. `curl -s "https://get.sdkman.io" | bash`
2. `source "$HOME/.sdkman/bin/sdkman-init.sh"`
3. `sdk use java 21.0.8-amzn`
4. `sdk default java 21.0.8-amzn`

### Neovim-dotnet
1. `pacman -S dotnet-sdk`
2. `dotnet tool install -g EasyDotnet`

> [!CAUTION]
> 如果需要直接修改`omnisharp`的配置，会意外导致Lsp无法被注册，不确定原因。
> 修复办法是: 直接在`~/.local/share/nvim/plugged/nvim-lspconfig/lsp/omnisharp.lua`中修改配置

### Neovim Remote LSP

```bash
pacman -S luarocks lua51
luarocks config lua_version 5.1
luarocks config variables.LUA_INCDIR /usr/include/luajit-2.1
proxychains luarocks install luasocket --lua-version=5.1 --force

# check if success
luajit -e "local socket = require('socket'); print(socket._VERSION)"
```

#### Windows OpenSSH Server
修改配置文件`C:\ProgramData\ssh\sshd_config`:
```
Port <your_port>
ListenAddress 127.0.0.1
PubkeyAuthentication yes
AuthorizedKeysFile	.ssh/authorized_keys
```
> [!CAUTION]
> windows里的权限配置很坑，`~/.ssh` `~/.ssh/authorized_keys` 两个文件的权限很容易造成ssh公私钥认证失败。使用`https://github.com/PowerShell/Win32-OpenSSH`所提供的脚本`FixHostFilePermission.ps1`可以解决问题。

# Kitty 配置
1. 安装环境：
```bash
# 由于kitty需要使用GPU，需要给WSL2添加GPU支持：https://www.intel.com/content/www/us/en/docs/oneapi/installation-guide-linux/2023-0/configure-wsl-2-for-gpu-workflows.html
# 因此必须使用特定Linux发行版（ubuntu20.04 / 22.04)
proxychains wsl --install -d Ubuntu-22.04

# Step 0. add mirrors
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
sudo vim /etc/apt/sources.list
# deb http://mirrors.aliyun.com/ubuntu/ jammy main restricted universe multiverse
# deb http://mirrors.aliyun.com/ubuntu/ jammy-updates main restricted universe multiverse
# deb http://mirrors.aliyun.com/ubuntu/ jammy-backports main restricted universe multiverse
# deb http://mirrors.aliyun.com/ubuntu/ jammy-security main restricted universe multiverse

sudo apt update
sudo apt upgrade -y

# Step 1. Add package repository
sudo apt-get install -y gpg-agent wget proxychains
proxychains wget -qO - https://repositories.intel.com/graphics/intel-graphics.key | sudo gpg --dearmor --output /usr/share/keyrings/intel-graphics.gpg
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/intel-graphics.gpg] https://repositories.intel.com/graphics/ubuntu focal-devel main' | sudo tee  /etc/apt/sources.list.d/intel.gpu.focal.list

# Step 2. Install runtime and development (optional) packages
sudo apt-get install \
  intel-opencl-icd \
  intel-level-zero-gpu level-zero \
  intel-media-va-driver-non-free libmfx1 libmfxgen1 libvpl2 \
  libegl-mesa0 libegl1-mesa libegl1-mesa-dev libgbm1 libgl1-mesa-dev libgl1-mesa-dri \
  libglapi-mesa libgles2-mesa-dev libglx-mesa0 libigdgmm11 libxatracker2 mesa-va-drivers \
  mesa-vdpau-drivers mesa-vulkan-drivers va-driver-all

# Step 3: Configure permissions: check https://www.intel.com/content/www/us/en/docs/oneapi/installation-guide-linux/2023-0/configure-wsl-2-for-gpu-workflows.html for more

# Step 4. Verify installation
sudo apt-get install clinfo mesa-utils
clinfo
glxinfo | grep "renderer string"
# OpenGL renderer string: D3D12 (Intel(R) UHD Graphics)
```
2. 安装kitty：
```bash
proxychains wget https://sw.kovidgoyal.net/kitty/installer.sh && chmod +x ./installer.sh && proxychains ./installer.sh
echo 'export PATH="$PATH:$HOME/.local/kitty.app/bin"' > ~/.bashrc && source ~/.bashrc
sudo apt install -y xdg-desktop-portal xdg-desktop-portal-gtk libnotify-bin

# 修复dbus报错
systemctl --user start xdg-desktop-portal.service systemctl --user start xdg-desktop-portal-gtk.service

# 修复notify报错
sudo apt install -y dunst libnotify-bin

# 预期效果：
# [0.598] Could not move child process into a systemd scope: [Errno 30] Failed to call StartTransientUnit: org.freedesktop.DBus.Error.PropertyReadOnly: Cannot set property OOMPolicy, or unknown property.
# 该报错不影响实际使用，暂不解决 
```
3. windows使用计划任务, 实现开机自启动`scripts/wsl_kitty.ps1`脚本

# Windows Terminal 配置
参考`settings.json`，直接使用该配置文件即可。

> [!TIP]
> 值得留意的是配置中的`sendInput`行为，可以利用这个方式做特殊命令的映射，类似于`kitty/wezterm`的`escape`