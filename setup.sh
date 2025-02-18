#!/usr/bin/env bash

# Logging Function
echo_log() {
  echo -e "[BUILD INFO] $1"
}

echo_log "Detecting Distribution..."
DISTRO=$(cat /etc/*-release | grep ^ID= | cut -d= -f2 | tr -d '"')
echo_log "Detected Distribution: $DISTRO"

case "$DISTRO" in 
  ubuntu|debian)
    echo_log "Syncing with Package Repositories (Required System Update)"
    sudo apt update -y
    echo_log "Installing build-essential, GNU Make, and Bear..."
    sudo apt install -y build-essential make bear 
    ;;
  fedora|rhel|centos|rocky|alma)
    echo_log "Syncing with Package Repositories (Required System Update)"
    sudo dnf update -y
    echo_log "Installing build-essential, GNU Make, and Bear..."
    sudo dnf group install -y "development-tools"
    sudo dnf install -y make bear 
    ;;
  arch|manjaro|endeavouros)
    echo_log "Syncing with Package Repositories (Required System Update)"
    sudo pacman -Syu -noconfirm
    echo_log "Installing build-essential, GNU Make, and Bear..."
    sudo pacman -S --noconfirm base-devel make bear 
    ;;
  *)
    echo_log "Unsupported Distribution: $DISTRO. Please Install Manually."
esac

echo_log "Completed Installation Successfully"

# Clean git history then initialise an empty repository
rm -rf .git/
git init 
git add * .gitignore 
git commit -a -m "First Commit"
echo_log "Setup Completed. Have Fun (Template Provided by CCynth1a)"
