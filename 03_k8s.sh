#!/usr/bin/env bash
# shellcheck disable=SC1091
source ./utils.sh

# https://github.com/derailed/k9s

brew install kubectl kubectx helm kustomize \
  derailed/k9s/k9s

# https://github.com/catppuccin/k9s
OUT="$HOME/.config/k9s/skins" && mkdir -p "$OUT"
curl -L https://github.com/catppuccin/k9s/archive/main.tar.gz |
  tar xz -C "$OUT" --strip-components=2 k9s-main/dist

cfg_file="$(repo_cfgfile 'k9s.yaml' || exit 1)"
create_symlink "$cfg_file" "$HOME/.config/k9s/config.yaml"
