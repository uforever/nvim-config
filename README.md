# nvim-config

#### 介绍

我的Neovim配置文件

#### 安装教程

```
git clone https://gitee.com/uforever/nvim-config.git ~/.config/nvim
```

运行`nvim`等待插件安装完成即可

```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

telescope需要的依赖

<https://github.com/BurntSushi/ripgrep>

<https://github.com/sharkdp/fd>

需要的依赖

```
nodejs npm unzip golang-go
```

golang
```
go env -w GO111MODULE=on
go env -w GOPROXY=https://goproxy.cn,direct
nvim
go env -w GO111MODULE=""
go env -w GOPROXY="https://proxy.golang.org,direct"
```
