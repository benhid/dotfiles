#!/bin/sh

set -e

if ! has_cmd 'wget'; then
  step "Installing wget..."
  brew install wget
fi
