#!/bin/bash
# exit if a command exits with a non-zero status
set -e

CHEZMOI_DIR=$HOME/.local/share/chezmoi

echo "🚀 Starting package installation..."

# pacman
# the grep is filtering out commends and blank lines
# --needed only installs if it is missing or out of date

echo "📦 Installing packages from official or extra repos..."
PACMAN_PACKAGES=$(cat "$CHEZMOI_DIR/packages/pacman" | grep -vE '^\s*#|^\s*$')
if [ -n "$PACMAN_PACKAGES" ]; then
  sudo pacman -S --needed --noconfirm $PACMAN_PACKAGES
else
  echo "No pacman packages to install."
fi

# yay aur helper checker
# if you decide to use paru rememver to change this
# Check if yay is installed. If not, clone and build it.

if ! command -v yay &>/dev/null; then
  echo "Installing YAY for AUR packages..."
  git clone https://aur.archlinux.org/yay-bin.git /tmp/yay-bin
  (cd /tmp/yay-bin && makepkg -si --noconfirm)
  rm -rf /tmp/yay-bin
else
  echo "🎉 YAY is already installed!"
fi

# aur

echo "📦 Installing packages from the AUR..."
AUR_PACKAGES=$(cat "$CHEZMOI_DIR/packages/aur" | grep -vE '^\s*#|^\s*$')
if [ -n "$AUR_PACKAGES" ]; then
  yay -S --needed --noconfirm $AUR_PACKAGES
else
  echo "No AUR packages to install."
fi

echo "🎉☕ Package installation complete! ☕🎉"
