#!/usr/bin/env bash
# shellcheck disable=SC1091
source "$(git rev-parse --show-toplevel)/scripts/utils.sh"

# https://github.com/LazyVim/LazyVim

# Install Rust
if [ ! -d "$HOME/.cargo" ]; then
  curl https://sh.rustup.rs -sSf | sh
fi
cargo install --locked tree-sitter-cli

brew install neovim \
  ripgrep fd tree-sitter node

cfg_dir="$(repo_cfgdir 'neovim' || exit 1)"
create_symlink "$cfg_dir" "$HOME/.config/nvim"
