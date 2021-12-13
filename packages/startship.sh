#!/bin/sh

set -e

if ! has_cmd 'starship'; then
  step "Installing starship..."
  curl_starship__base_path="/usr/local/bin"
  if test ! -d "$curl_starship__base_path"; then
    mkdir -p "$curl_starship__base_path"
  fi
  sh -c "$(curl -fsSL https://starship.rs/install.sh)" - -y -b "$curl_starship__base_path"
fi
