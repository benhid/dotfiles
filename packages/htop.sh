#!/bin/sh

set -e

if ! has_cmd 'htop'; then
  step "Installing htop..."
  brew install htop
fi
