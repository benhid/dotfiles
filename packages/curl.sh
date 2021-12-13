#!/bin/sh

set -e

if ! has_cmd 'curl'; then
  step "Installing curl..."
  brew install curl
fi
