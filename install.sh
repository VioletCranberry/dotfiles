#!/usr/bin/env bash
set -euo pipefail

doIt() {
  ./scripts/01_terminal.sh
  ./scripts/02_neovim.sh
  ./scripts/03_k8s.sh
  ./scripts/04_bat.sh
}

echo "Installing dotfiles..." && doIt && echo "Done!"
