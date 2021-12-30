#!/bin/sh

set -e

if ! has_cmd 'exa'; then
  step "Installing exa..."
  brew install exa
fi
