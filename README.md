## Overview

My personal setup is based on:

- ZSH
- [Alacritty](https://alacritty.org)
- [Starship](https://starship.rs/)
- [Helix editor](https://helix-editor.com/)
- [Tmux](https://github.com/tmux/tmux)
- Hack Nerd Font

Additionally, I make use of several fancy tools such as:

- [jq](https://github.com/jqlang/jq)
- [bat](https://github.com/sharkdp/bat)
- [fzf](https://github.com/junegunn/fzf)
- [dust](https://github.com/bootandy/dust)
- [lazygit](https://github.com/jesseduffield/lazygit)

## Installation

Most of these tools are available via Homebrew, so you can install them from there.

For the fonts, you can download them from the [Nerd Fonts repository](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack) and install them manually.

Install with:

```bash
git clone https://github.com/benhid/dotfiles.git
cd dotfiles
mkdir -p ~/.config/
cp -r config/* ~/.config/
cp -r zsh/. ~/
```
