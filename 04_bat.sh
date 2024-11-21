#!/usr/bin/env bash
# shellcheck disable=SC1091
source ./utils.sh

brew install bat # https://github.com/sharkdp/bat

# https://github.com/catppuccin/bat

mkdir -p "$(bat --config-dir)/themes"

wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Latte.tmTheme
wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Frappe.tmTheme

bat cache --build
