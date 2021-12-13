#!/bin/sh

set -e

esc_red=''
esc_yellow=''
esc_green=''
esc_blue=''
esc_reset=''

if test -n "$TERM" -a -n "$(command -v tput)" && test -n "$(tput colors)" && test "$(tput colors)" -ge 8; then
  esc_reset="$(tput sgr0)"
  if test "$(tput colors)" -gt 8; then
    esc_blue="$(tput setaf 12)"
    esc_green="$(tput setaf 10)"
    esc_yellow="$(tput setaf 11)"
    esc_red="$(tput setaf 9)"
  else
    esc_blue="$(tput setaf 4)"
    esc_green="$(tput setaf 2)"
    esc_yellow="$(tput setaf 3)"
    esc_red="$(tput setaf 1)"
  fi
fi

#===========================
# Utilities Functions
#===========================

quit() {
  if test -z "$1"; then
    exit
  else
    exit "$1"
  fi
}

print() {
  if test "$#" -le 2; then
    printf "%s %s\n" "$1" "$2"
    return
  fi
  printf "%-$1s%s\n" "$2" "$3"
}

error() {
  if test -z "$@"; then
    printf >&2 "\n"
    return
  fi
  printf "$esc_red==> ERROR$esc_reset: %s\n" "$*" >&2
}

warn() {
  if test -z "$@"; then
    print
    return
  fi
  print "$esc_yellow==> WARN$esc_reset: $*"
}

info() {
  print "$esc_green==> INFO:$esc_reset $*"
}

step() {
  print "$esc_blue==>$esc_reset $*"
}

copy() {
  cp -n "configs/$1" "$2" || true
}

has_cmd() {
  has_cmd__cmd="$1"
  test -n "$(command -v "$has_cmd__cmd")"
}

#===========================
# Main
#===========================

main() {
  if ! test -d "$HOME/.dots"; then
    warn "Local copy of dotfiles is not found at $HOME/.dots"
    info "Installing dotfiles for the first time"
    git clone --depth=1 https://github.com/benhid/dotfiles.git "$HOME/.dots"
    cd "$HOME/.dots"
  fi

  step "Installing Brew Packages..."

  for try_run_install__pkg_path in packages/*.sh; do
    name="$(basename "$try_run_install__pkg_path")"
    name="${name%.*}"
    step "  - $name"
    . "$try_run_install__pkg_path"
  done

  step "Running Setups..."

  for try_run_install__setup_path in setup/*.sh; do
    name="$(basename "$try_run_install__setup_path")"
    name="${name%.*}"
    step "  - $name"
    . "$try_run_install__setup_path"
  done

  quit
}

main
