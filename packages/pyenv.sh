#!/bin/sh

set -e

if ! has_cmd 'pyenv'; then
  step "Installing pyenv..."
  brew install pyenv
fi
