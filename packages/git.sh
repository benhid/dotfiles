#!/bin/sh

set -e

if ! has_cmd 'git'; then
  step "Installing git..."
  brew install git
fi
