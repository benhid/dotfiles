#!/bin/sh

set -e

if ! has_cmd 'shellcheck'; then
  step "Installing shellcheck..."
  brew install shellcheck
fi
