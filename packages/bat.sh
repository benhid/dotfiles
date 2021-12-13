#!/bin/sh

set -e

if ! has_cmd 'bat'; then
  step "Installing bat..."
  brew install bat
fi
