# Installation

## Neovim

1. Install [Pre-requisites](https://github.com/neovim/neovim/wiki/Building-Neovim#ubuntu--debian)

2. Clone git

```bash
git clone https://github.com/neovim/neovim.git
```

3. Build

```bash
make CMAKE_BUILD_TYPE=Release
```

4. Install

```bash
sudo make install
```

## Plug

```bash
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## In Neovim

1. `:PlugInstall`
2. `:checkhealth`
" Quick search mapped to "s"
Plug 'justinmk/vim-sneak'

__Options for file finder:__

- fzf
- CtrlP
- vim-clap

__Things I'm looking for in a python env "__

- Syntax highlinting
- Auto completetion
- Go to definition
- Auto import/quick fix
- Basic linting (pyflakes?)
- Import sorting (isort)
