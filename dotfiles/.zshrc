if [[ -f "/opt/homebrew/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Load starship theme
zinit ice as"command" from"gh-r" \
  atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
  atpull"%atclone" src"init.zsh"
zinit light starship/starship

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Enable completion system
autoload -Uz compinit && compinit

# History
HISTSIZE=5000               # Set the maximum number of history entries stored in memory.
HISTFILE=~/.zsh_history     # Define the file where the command history will be saved.
SAVEHIST=$HISTSIZE          # Limit the number of entries saved to the history file to match HISTSIZE.
HISTDUP=erase               # Prevent duplicate entries in the history by erasing older duplicates.
setopt appendhistory        # Append new history entries to the history file instead of overwriting it.
setopt sharehistory         # Share the command history across all Zsh sessions in real-time.
setopt hist_ignore_space    # Ignore commands that start with a space from being added to history
setopt hist_ignore_all_dups # Avoid saving commands that have already been saved (ignore all duplicates).
setopt hist_save_no_dups    # Prevent saving duplicate commands to the history file.
setopt hist_ignore_dups     # Ignore consecutive duplicate commands when recording history.
setopt hist_find_no_dups    # Prevent searching the history for duplicates while using reverse search (Ctrl+R).

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'                     # Case-insensitive matching for completions.
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"                    # Use LS_COLORS for completions.
zstyle ':completion:*' menu no                                             # Disable completion menu.
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'         # Custom fzf-tab preview for cd.
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath' # Custom fzf-tab preview for zoxide.

# Reapply Zinit configurations quietly on shell startup
zinit cdreplay -q

# Enable shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init zsh --cmd j)"

export FZF_DEFAULT_OPTS=" \
  --color=bg+:#414559 --color=gutter:-1 --multi"

# Dracula theme for eza (https://draculatheme.com/exa)
export EXA_COLORS="\
uu=36:\
gu=37:\
sn=32:\
sb=32:\
da=34:\
ur=34:\
uw=35:\
ux=36:\
ue=36:\
gr=34:\
gw=35:\
gx=36:\
tr=34:\
tw=35:\
tx=36:"

# Define aliases
alias k='kubectl'

alias ll='eza -lg --icons --color=always'
alias lg='lazygit'
alias ks='kubectx'
alias ff='fzf --preview "bat --color=always --style=numbers --line-range=:500 {}" --preview-window=right:wrap'

alias lla='eza -lga --icons --color=always'

# Define environment variables
export EDITOR='nvim'
export GIT_EDITOR='nvim'
export KUBE_EDITOR='nvim'
export K9S_CONFIG_DIR="$HOME/.config/k9s"
export GPG_TTY=$TTY
export BAT_THEME="Catppuccin Frappe"
