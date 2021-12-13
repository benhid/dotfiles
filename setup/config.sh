#!/bin/sh

set -e

setup_config() {
  step "Setting up configurations..."

  step "  - git"
  copy git/gitconfig "$HOME/.gitconfig"

  #step "  - starship"
  #copy starship/starship.toml "$HOME/.config/starship.toml"

  step "  - zsh"
  copy zsh/zshrc "$HOME/.zshrc"
}

setup_config
