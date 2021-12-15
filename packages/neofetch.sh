
#!/bin/sh

set -e

if ! has_cmd 'neofetch'; then
  step "Installing neofetch..."
  brew install neofetch
fi
