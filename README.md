# Ex10si0n's Neovim Lua Configuration

## Quickly setup

0. Clone this repository into your Neovim Configuration

```bash
git clone git@github.com:Ex10si0n/nvim-config-lua.git ~/.config/nvim
```

1. Install `Packer` the lua package manager

```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

2. Launch Neovim and install the plugins using `Packer`

```
:PackerInstall
```

3. Install LSP Servers using `Mason`

```
:MasonInstall lua-language-server jedi-language-server typst-lsp eslint-lsp rust-analyzer
```
