# Dark Arch: 打造最强开发环境
![](img/main.png)
![](img/index.png)
> [!IMPORTANT] 
> 本仓库仅记录具体安装命令，用于个人快速搭建环境，不涉及任何插件二开细节、工具原理、使用方式等解释，请自行辨别。

# 项目环境

- linux kitty || windows terminal
- wsl2 with arch linux
- debian 13
- fish || ohmyzsh
- tmux && ohmytmux
- neovim


# Arch基本配置
1. 添加国内镜像：`sh -c 'echo -e "Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/\$repo/os/\$arch\nServer = https://mirrors.aliyun.com/archlinux/\$repo/os/\$arch\nServer = https://mirrors.ustc.edu.cn/archlinux/\$repo/os/\$arch\nServer = https://mirror.sjtu.edu.cn/archlinux/\$repo/os/\$arch" > /etc/pacman.d/mirrorlist'`
2. 更新系统：`pacman -Syu`
3. update repo: `pacman -Syy`
3. 安装基本工具：`pacman -S --needed base-devel git curl wget unzip zip gdb lib32-glibc lib32-gcc-libs net-tools openssh`
4. 安装常用工具：`pacman -S zsh fzf ripgrep rsync fd jq bat vim neovim tmux proxychains-ng zoxide fontconfig nodejs universal-ctags nodejs npm openssh `
5. `proxychains`添加代理：`nvim /etc/proxychains.conf`
6. 安装`ohmyzsh`:`proxychains sh -c "$(proxychains curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
7. 修改`.zshrc`文件（参考该项目的`.zshrc`）
8. 修改`/etc/locale.gen`，解注释：`en_US.UTF-8 UTF-8`, 运行`locale-gen`  

### 开启`github`权限

```bash
git config --global credential.helper store
git config --system credential.helper store

# 从Github 获取Access Token，开启repo权限
# git push时，要求填写密码。密码填写为Acsess Token即可
```

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

# 安装paru
proxychains git clone https://aur.archlinux.org/paru.git
cd paru
proxychains makepkg -s
su root
pacman -U /home/builduser/paru/paru-2.1.0-1-x86_64.pkg.tar.zst
```

# Ubuntu & Debian 配置
```bash
# 1. 安装常用工具
sudo apt update && sudo apt install -y build-essential gcc g++ make cmake autoconf automake libtool pkg-config libc6 libc6-dev libstdc++6 libssl-dev libffi-dev zlib1g zlib1g-dev wget curl git unzip net-tools libevent-dev libncurses-dev yacc

# 2. 安装常用工具
sudo apt-get install -y zsh fzf ripgrep rsync jq bat zoxide fontconfig nodejs universal-ctags nodejs npm proxychains-ng socat

# 3. 安装重要工具（由于apt版本管理滞后，部分重要软件手动安装新版）
# ohmyzsh
proxychains4 sh -c "$(proxychains4 curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# tmux
mkdir ~/tools/common && cd ~/tools/common && proxychains git clone https://github.com/tmux/tmux && cd tmux && proxychains4 sh autogen.sh && ./configure && make
sudo make install && tmux -V # tmux next-3.6
cd ~/tools/common && git clone --single-branch https://github.com/gpakosz/.tmux.git oh-my-tmux && cd oh-my-tmux
mkdir -p ~/.config/tmux
ln -s ${PWD}/.tmux.conf ~/.config/tmux/tmux.conf 
cp ${PWD}/.tmux.conf.local ~/.config/tmux/tmux.conf.local
mkdir -p ~/.tmux/plugins && cd ~/.tmux/plugins && proxychains git clone 'https://github.com/tmux-plugins/tmux-copycat' && proxychains git clone 'https://github.com/tmux-plugins/tmux-cpu' && proxychains git clone 'https://github.com/tmux-plugins/tmux-resurrect' && proxychains git clone 'https://github.com/aserowy/tmux.nvim'

# pyenv
proxychains4 curl -fsSL https://pyenv.run | proxychains4 bash
source ~/.zshrc && proxychains pyenv install 3.13.6 && pyenv global 3.13.6

# rust
proxychains4 curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | proxychains4 sh

# neovim
cd ~/tools/common && proxychains wget https://github.com/neovim/neovim/releases/download/v0.11.4/nvim-linux-x86_64.tar.gz && tar -xvzf nvim-linux-x86_64.tar.gz && rm nvim-linux-x86_64.tar.gz
cd ~/tools/common/nvim-linux-x86_64/bin/ && echo 'export PATH='${PWD}':$PATH' >> ~/.zshrc
source ~/.zshrc


# Docker
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo proxychains apt-get update
sudo proxychains apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Docker 代理：使用privoxy将socks5代理转http
sudo apt install -y privoxy
echo 'forward-socks5t / user:pass@127.0.0.1:1080 .' | sudo tee -a /etc/privoxy/config
sudo systemctl restart privoxy
sudo mkdir -p /etc/systemd/system/docker.service.d

sudo tee /etc/systemd/system/docker.service.d/proxy.conf > /dev/null <<EOF
[Service]
Environment="HTTP_PROXY=http://127.0.0.1:8118"
Environment="HTTPS_PROXY=https://127.0.0.1:8118"
Environment="NO_PROXY=localhost,127.0.0.1"
EOF

sudo systemctl daemon-reexec
sudo systemctl restart docker
sudo docker run hello-world
# 如果遇到docker compose，需要修改compose.yml文件来添加proxy：
#    environment:
#      - HTTP_PROXY=http://127.0.0.1:8118
#      - HTTPS_PROXY=https://127.0.0.1:8118
#      - NO_PROXY=localhost,127.0.0.1

# FossFlow
mkdir -p ~/tools/common/fossflow && cd ~/tools/common/fossflow && proxychains git clone https://github.com/stan-smith/FossFLOW && cd FossFLOW
sudo docker run -p 7080:80 -v $(pwd)/diagrams:/data/diagrams stnsmith/fossflow:latest

# 4. 更新配置
cd ~/tools/common && proxychains4 git clone https://github.com/Ky9oss/DarkArch && cd DarkArch
cp ./ohmyzsh/.zshrc ~/.zshrc && cd ~/tools/common/nvim-linux-x86_64/bin/ && echo 'export PATH='${PWD}':$PATH' >> ~/.zshrc
cp ./tmux/tmux.conf.local ~/.config/tmux/tmux.conf.local
cp -r ./nvim ~/.config/nvim
```

# Ohmyzsh 配置
```sh
mkdir -p ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins
proxychains git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
proxychains git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
proxychains git clone https://github.com/jeffreytse/zsh-vi-mode.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-vi-mode
source ~/.zshrc
```

# fish 配置
```sh
sudo apt-add-repository ppa:fish-shell/release-4
sudo apt update
sudo apt install fish
chsh -s /usr/bin/fish # 修改默认shell
fish_config theme choose 'Old School'
fish_config prompt choose disco
```

# Tmux 配置
1. 安装`tpm`：`mkdir -p ~/.tmux/plugins/tpm && proxychains git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
2. 安装`oh-my-tmux`，随后修改`~/.config/tmux/tmux.conf.local`,参考项目文件`tmux.conf.local`
```sh
cd ~/tools/common && git clone --single-branch https://github.com/gpakosz/.tmux.git oh-my-tmux && cd oh-my-tmux
mkdir -p ~/.config/tmux
ln -s ${PWD}/.tmux.conf ~/.config/tmux/tmux.conf 
cp ${PWD}/.tmux.conf.local ~/.config/tmux/tmux.conf.local
mkdir -p ~/.tmux/plugins && cd ~/.tmux/plugins && proxychains git clone 'https://github.com/tmux-plugins/tmux-copycat' && proxychains git clone 'https://github.com/tmux-plugins/tmux-cpu' && proxychains git clone 'https://github.com/tmux-plugins/tmux-resurrect' && proxychains git clone 'https://github.com/aserowy/tmux.nvim'
```

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
1. 将其他`nvim/`下所有文件复制至`~/.config/nvim/`(linux) 或 `~\AppData\Local\nvim`(windows)
2. 重启nvim

### Neovim-markdown
1. `MasonInstall marksman`

### Neovim-rust
1. 安装环境：`proxychains curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`
2. 使用`mason`安装：`:MasonInstall rust-analyzer codelldb`

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

# Windows
## Powershell 配置
管理员运行powershell：
```ps1
Install-Module -Name PowerShellGet -Force; exit
Install-Module PSReadLine -Repository PSGallery -Scope CurrentUser -Force
Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://ohmyposh.dev/install.ps1'))
# 追加oh-my-posh到env $env:Path += ";C:\Users\user\AppData\Local\Programs\oh-my-posh\bin"
oh-my-posh init powershell --config 'atomic' | Out-File -FilePath $PROFILE -Append -Encoding utf8
Install-Script -Name Refresh-EnvironmentVariables -RequiredVersion 1.0.1
[System.Environment]::SetEnvironmentVariable("POWERSHELL_SCRIPTS", "C:\Program Files\WindowsPowerShell\Scripts", [System.EnvironmentVariableTarget]::User)

# 下面是pyenv-win & pyenv-win-venv的安装（不建议使用，两个工具之间的交互有问题，我搞了半天没弄好）
# windows里建议anaconda，linux里建议pyenv
[System.Environment]::SetEnvironmentVariable("DRUNTIME", "<your-path>", "MACHINE")
proxychains git clone https://github.com/pyenv-win/pyenv-win.git $env:DRUNTIME
[System.Environment]::SetEnvironmentVariable("PYENV", "$env:DRUNTIME\pyenv-win", "MACHINE")
[System.Environment]::SetEnvironmentVariable( `
  "PATH", `
  "$env:PYENV\pyenv-win\bin;$env:PYENV\pyenv-win\shims;$([System.Environment]::GetEnvironmentVariable('PATH','MACHINE'))", `
  "MACHINE" `
)
proxychains git clone https://github.com/pyenv-win/pyenv-win-venv "$env:DRUNTIME\.pyenv-win-venv"
[System.Environment]::SetEnvironmentVariable( `
  "PATH", `
  "$env:DRUNTIME\.pyenv-win-venv\bin;$([System.Environment]::GetEnvironmentVariable('PATH','MACHINE'))", `
  "MACHINE" `
)
```

## Windows OpenSSH Server
修改配置文件`C:\ProgramData\ssh\sshd_config`:
```
Port <your_port>
ListenAddress 127.0.0.1
PubkeyAuthentication yes
AuthorizedKeysFile	.ssh/authorized_keys
```
> [!CAUTION] 坑点
> 1. `~/.ssh` `~/.ssh/authorized_keys` 两个文件的权限很容易造成ssh公私钥认证失败。使用`https://github.com/PowerShell/Win32-OpenSSH`所提供的脚本`FixHostFilePermission.ps1`可以解决问题。
> 2. `~/.ssh/authorized_keys`手动复制公钥时可能会因为CRLF格式添加额外的`\r`，可以通过`cat -A xxx`来查看文件里是否有`^M`, 如果有则使用`dos2unix`删除：`dos2unix /mnt/c/Users/<User>/.ssh/authorized_keys`
> 3. OpenSSH新版中的公私钥默认格式为`OpenSSH`格式，使用`ssh-keygen -t rsa -m PEM -f ~/.ssh/xxx`命令生成公私钥，`-m PEM`用于指定格式为PEM。

# Kitty 配置
> [!WARNING]
> 为了终端图片绘制功能，在windows上通过WSLg实现kitty GPU功能是个坏主意，wsl2启动的UI界面总是有延迟。终端仿真器应始终运行在本机上。
1. 安装环境：
```bash
# 由于kitty需要使用GPU，需要给WSL2添加GPU支持：https://www.intel.com/content/www/us/en/docs/oneapi/installation-guide-linux/2023-0/configure-wsl-2-for-gpu-workflows.html
# 因此必须使用特定Linux发行版（ubuntu20.04 / 22.04)
proxychains wsl --install -d Ubuntu-22.04

# Step 0. add mirrors and zh_CN support
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
sudo vim /etc/apt/sources.list
# deb http://mirrors.aliyun.com/ubuntu/ jammy main restricted universe multiverse
# deb http://mirrors.aliyun.com/ubuntu/ jammy-updates main restricted universe multiverse
# deb http://mirrors.aliyun.com/ubuntu/ jammy-backports main restricted universe multiverse
# deb http://mirrors.aliyun.com/ubuntu/ jammy-security main restricted universe multiverse

sudo apt update
sudo apt upgrade -y

sudo apt install fonts-noto-cjk fonts-wqy-zenhei fonts-wqy-microhei
sudo apt install language-pack-zh-hans language-pack-zh-hans-base
sudo update-locale LANG=zh_CN.UTF-8
source /etc/default/locale

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

# 安装字体
proxychains git clone https://github.com/ryanoasis/nerd-fonts && cd nerd-fonts/ && chmod +x ./install.sh && ./install.sh Hack && ./install.sh Noto

# 修改配置文件`~/.config/kitty/kitty.conf`，并复制背景图片到系统中

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

# Ansible 配置
```sh
mkdir -p ~/tools/common/ansible && cd ~/tools/common/ansible && proxychains pyenv virtualenv 3.13.6 ansible && pyenv local ansible
proxychains pip install ansible
```

# WSL 配置
如果常规安装出错，可以选择手动安装方式：
1. 安装`archlinux-xxx.wsl`文件：[https://mirrors.aliyun.com/archlinux/wsl/latest/?spm=a2c6h.25603864.0.0.3b896e31D6YFPc]
2. `wsl --install --from-file xxx.wsl`安装Arch

重点配置如下：
- 确保使用Mirrored mode networking网络式而不是NAT或桥接模式