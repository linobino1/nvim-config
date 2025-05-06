# nvim-config

This is my neovim configuration.

## Install

If you have a neovim config already, empty (and backup) `~/.config/nvim` first.

```sh
git clone https://github.com/linobino1/nvim-config.git ~/.config/nvim
```

### Dependencies:

```sh
# used by lazy.nvim
brew install luarocks
```

### Symbols

nvim-tree needs a nerd font to display the symbols properly. Download it from https://www.nerdfonts.com/font-downloads and activate it in your terminal.

If your font icons do are shown as a `_`, make sure $LANG is set properly with support for unicode characters. This might especially not work when using tmux. In iTerm, activate the setting `Profiles > Terminal > Environment "Set locale environment variables automatically`.

### Ideas

- use [tmux-status.nvim](https://github.com/christopher-francisco/tmux-status.nvim) and [noice.nvim](https://github.com/folke/noice.nvim)? to simplify the status line at the bottom.
