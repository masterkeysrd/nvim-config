# Master Keys VIM Configuration

This is my vim editor configurations. I use it for my daily work and I hope you find it useful.

## Installation

1. Clone this repository to your home directory:

```bash
git clone https://github.com/masterkeysrd/nvim-config.git ~/.config/nvim
```

2. Install [Packer](https://github.com/wbthomason/packer.nvim) plugin manager:

```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

3. Install System Dependencies:

MacOS:

```bash
brew install ripgrep # For Telescope
brew install gnu-sed # For Spectre
```

Arch Linux:

```bash
sudo pacman -S ripgrep # For Telescope
```

4. Open Neovim and run `:PackerInstall` to install plugins.

5. Restart Neovim.


