# nvim-config

#### Description

my neovim configuration

#### Installation

```
git clone https://gitee.com/uforever/nvim-config.git ~/.config/nvim
```

Run `nvim` and wait for the plugins to be installed

```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

telescope dependencies

<https://github.com/BurntSushi/ripgrep>

<https://github.com/sharkdp/fd>

dependencies

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
