#!/usr/bin/env bash
set -euo pipefail

(return 0 2>/dev/null) && sourced=1 || sourced=0
if [ "$sourced" -eq 0 ]; then
  echo "This script must be sourced, not executed directly."
  exit 1
fi

REPO_ROOT_DIR="$(git rev-parse --show-toplevel)"

repo_cfgdir() {
  local -r config_dir="configs/$1"
  local -r dir_path="$REPO_ROOT_DIR/$config_dir"
  if [[ ! -d "$dir_path" ]]; then
    echo "Error: Config directory '$dir_path' does not exist." >&2
    return 1
  fi
  printf "%s\n" "$dir_path"
}

repo_cfgfile() {
  local -r config_dir="configs/$1"
  local -r file_path="$REPO_ROOT_DIR/$config_dir"
  if [[ ! -e "$file_path" ]]; then
    echo "Error: Config file '$file_path' does not exist." >&2
    return 1
  fi
  printf "%s\n" "$file_path"
}

repo_dotfile() {
  local -r dotfiles_dir="dotfiles/$1"
  local -r file_path="$REPO_ROOT_DIR/$dotfiles_dir"
  if [[ ! -e "$file_path" ]]; then
    echo "Error: Dotfile '$file_path' does not exist." >&2
    return 1
  fi
  printf "%s\n" "$file_path"
}

function backup_if_exists() {
  local -r target="$1"
  if [ -e "$target" ] && [ ! -L "$target" ]; then
    echo "Backing up the existing file/directory."
    mv "$target" "$target.bak"
  fi
}

function create_symlink() {
  local -r source_file="$1"
  local -r target_file="$2"
  if [ -L "$target_file" ]; then
    echo "$target_file is already a symlink. Updating the symlink." && rm "$target_file"
  else
    backup_if_exists "$target_file"
  fi
  ln -s "$source_file" "$target_file"
  echo "Symlink created: $source_file -> $target_file"
}
