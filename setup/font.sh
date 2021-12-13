#!/bin/sh

set -e

install_font() {
  install_fonts__name="$1"
  install_fonts__file="$2"
  install_fonts__url="$3"

  install_fonts__font_path="$HOME/.local/share/fonts"

  if test -d "$HOME/Library/Fonts"; then
    install_fonts__font_path="$HOME/Library/Fonts"
  fi

  info "Installing $install_fonts__name..."

  if test -f "$install_fonts__font_path/$install_fonts__file"; then
    warn "Font is already installed."
  else
    step "Downloading and installing $install_fonts__name..."
    curl --create-dirs -fsL "$install_fonts__url" -o "$install_fonts__font_path/$install_fonts__file"
  fi
}

setup_font() {
  install_font "JetBrains Mono Nerd Font" "JetBrains Mono Regular Nerd Font Complete.ttf" "https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/JetBrainsMono/Ligatures/Regular/complete/JetBrains%20Mono%20Regular%20Nerd%20Font%20Complete.ttf?raw=true"
  install_font "Hack Regular Nerd Font" "Hack Regular Nerd Font Complete.ttf" "https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf?raw=true"
}

setup_font
