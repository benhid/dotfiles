#!/bin/sh

set -e

try_generate_keypair() {
  try_generate_keypair__path="$HOME/.ssh/$1.id_rsa"
  if test -f "$try_generate_keypair__path"; then
    warn "SSH keypair for $1 is already exists"
  else
    step "Generating SSH keypair for $1..."
    ssh-keygen -b 2048 -t rsa -f "$try_generate_keypair__path" -q -N ""
  fi
}

setup_ssh() {
  if ! test -d "$HOME/.ssh"; then
    step "Creating SSH directory..."
    mkdir -p "$HOME/.ssh"
  fi
  
  # generate GitHub key pair
  try_generate_keypair github

  # generate GitLab key pair
  try_generate_keypair gitlab

  # generate Bitbucket key pair
  try_generate_keypair bitbucket

  step "Copying SSH config..."
  
  copy ssh/config "$HOME/.ssh/config"
}

if has_cmd 'ssh-keygen'; then
  setup_ssh
fi
