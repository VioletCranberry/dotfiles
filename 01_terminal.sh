#!/usr/bin/env bash
# shellcheck disable=SC1091
source ./utils.sh

# https://github.com/ohmyzsh/ohmyzsh
# https://github.com/starship/starship
# https://github.com/wez/wezterm

# Install oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install wezterm and fonts
brew install --cask font-jetbrains-mono-nerd-font wezterm

dotfiles=(
  ".wezterm.lua"
  ".zshrc"
  ".tmux.conf"
)

for file in "${dotfiles[@]}"; do
  cfg_file="$(repo_dotfile "$file" || exit 1)"
  create_symlink "$cfg_file" "$HOME/$file"
done

cfg_file="$(repo_cfgfile 'starship.toml' || exit 1)"
create_symlink "$cfg_file" "$HOME/.config/starship.toml"

# https://github.com/tmux/tmux
# https://github.com/junegunn/fzf
# https://github.com/ajeetdsouza/zoxide
# https://github.com/eza-community/eza
# https://github.com/jqlang/jq
# https://github.com/mikefarah/yq
# https://github.com/jesseduffield/lazygit

# https://www.gnu.org/software/coreutils/

brew install tmux fzf zoxide eza jq yq coreutils lazygit
