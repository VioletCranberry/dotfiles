#!/usr/bin/env bash
# shellcheck disable=SC1091
source "$(git rev-parse --show-toplevel)/scripts/utils.sh"

# https://github.com/ohmyzsh/ohmyzsh
# https://github.com/starship/starship
# https://ghostty.org

# Install oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install ghostty and fonts
brew install --cask font-jetbrains-mono-nerd-font ghostty

# dotfiles=(
#   ".wezterm.lua"
#   ".zshrc"
#   ".tmux.conf"
# )

# for file in "${dotfiles[@]}"; do
#   cfg_file="$(repo_dotfile "$file" || exit 1)"
#   create_symlink "$cfg_file" "$HOME/$file"
# done

cfg_file="$(repo_dotfile ".zshrc" || exit 1)"
create_symlink "$cfg_file" "$HOME/$cfg_file"

cfg_file="$(repo_cfgfile 'starship.toml' || exit 1)"
create_symlink "$cfg_file" "$HOME/.config/starship.toml"

cfg_file="$(repo_cfgfile 'ghostty' || exit 1)"
create_symlink "$cfg_file" "$HOME/.config/ghostty/config"

# https://github.com/tmux/tmux
# https://github.com/junegunn/fzf
# https://github.com/ajeetdsouza/zoxide
# https://github.com/eza-community/eza
# https://github.com/jqlang/jq
# https://github.com/mikefarah/yq
# https://github.com/jesseduffield/lazygit

# https://www.gnu.org/software/coreutils/

brew install fzf zoxide eza jq yq coreutils lazygit
