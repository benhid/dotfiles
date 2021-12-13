#!/bin/sh

set -e

if ! has_cmd 'jq'; then
  step "Installing jq..."
  brew install jq
fi
