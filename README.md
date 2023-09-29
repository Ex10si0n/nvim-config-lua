# Ex10si0n's Neovim Lua Configuration

## Quickly setup

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
