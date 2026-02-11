# =============================================================================
# .zshrc — modern zsh configuration
# =============================================================================

# --- Resolve dotfiles directory (follow symlink to find repo) ----------------
if [ -L "$HOME/.zshrc" ]; then
    DOTFILES_DIR="$(cd "$(dirname "$(readlink "$HOME/.zshrc")")/.." && pwd)"
else
    DOTFILES_DIR="$(cd "$(dirname "${(%):-%x}")/.." && pwd)"
fi
export DOTFILES_DIR

# --- Early essentials --------------------------------------------------------
export GPG_TTY=$(tty)
export PATH="$HOME/.local/bin:$PATH"
export EDITOR="nvim"
export VISUAL="nvim"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# --- Homebrew (macOS) --------------------------------------------------------
if [ -f /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -f /usr/local/bin/brew ]; then
    eval "$(/usr/local/bin/brew shellenv)"
fi

# --- History -----------------------------------------------------------------
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000
setopt EXTENDED_HISTORY          # timestamps in history
setopt HIST_EXPIRE_DUPS_FIRST    # expire dupes first when trimming
setopt HIST_IGNORE_DUPS          # no consecutive duplicates
setopt HIST_IGNORE_ALL_DUPS      # remove older duplicate
setopt HIST_IGNORE_SPACE         # commands starting with space not saved
setopt HIST_FIND_NO_DUPS         # no dupes in search results
setopt HIST_SAVE_NO_DUPS         # no dupes written to file
setopt SHARE_HISTORY             # share history across sessions
setopt INC_APPEND_HISTORY        # append immediately, not on exit

# --- Shell options -----------------------------------------------------------
setopt AUTO_CD                   # cd by typing directory name
setopt AUTO_PUSHD                # pushd on every cd
setopt PUSHD_IGNORE_DUPS         # no duplicate dirs in stack
setopt PUSHD_SILENT              # don't print stack after pushd
setopt CORRECT                   # command spelling correction
setopt INTERACTIVE_COMMENTS      # allow # comments in interactive shell
setopt NO_BEEP                   # silence

# --- Zinit plugin manager ----------------------------------------------------
ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zinit/zinit.git"
if [ -d "$ZINIT_HOME" ]; then
    source "${ZINIT_HOME}/zinit.zsh"

    # Plugins
    zinit light zsh-users/zsh-completions
    zinit light zsh-users/zsh-autosuggestions
    zinit light zsh-users/zsh-syntax-highlighting  # must be last
else
    echo "[dotfiles] zinit not found. Run install.sh to set up plugins."
fi

# --- Completion system -------------------------------------------------------
autoload -Uz compinit
# Only regenerate dump once per day
if [ -z "$ZSH_COMPDUMP" ]; then
    ZSH_COMPDUMP="${ZDOTDIR:-$HOME}/.zcompdump"
fi
if [ "$(find "$ZSH_COMPDUMP" -mtime +1 2>/dev/null)" ] || [ ! -f "$ZSH_COMPDUMP" ]; then
    compinit -d "$ZSH_COMPDUMP"
else
    compinit -C -d "$ZSH_COMPDUMP"
fi

zstyle ':completion:*' menu select                                    # arrow key menu
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'           # case-insensitive
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"              # colored completions
zstyle ':completion:*' group-name ''                                  # group by category
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'    # category headers
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' complete-options true

# Replay completions from zinit plugins
command -v zinit &>/dev/null && zinit cdreplay -q

# --- Key bindings ------------------------------------------------------------
bindkey -e                                    # emacs mode (standard terminal)
bindkey '^[[A' history-search-backward        # up arrow: history search
bindkey '^[[B' history-search-forward         # down arrow: history search
bindkey '^[[3~' delete-char                   # delete key
bindkey '^[[H' beginning-of-line              # home key
bindkey '^[[F' end-of-line                    # end key
bindkey '^[b' backward-word                   # alt-left
bindkey '^[f' forward-word                    # alt-right

# --- FZF integration ---------------------------------------------------------
if command -v fzf &>/dev/null; then
    export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border --info=inline'

    # Use fd for file finding if available
    if command -v fd &>/dev/null; then
        export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
        export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
        export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
    fi

    # Source fzf keybindings — path differs by OS
    if [ -f "${HOMEBREW_PREFIX}/opt/fzf/shell/key-bindings.zsh" ]; then
        source "${HOMEBREW_PREFIX}/opt/fzf/shell/key-bindings.zsh"
        source "${HOMEBREW_PREFIX}/opt/fzf/shell/completion.zsh"
    elif [ -f /usr/share/doc/fzf/examples/key-bindings.zsh ]; then
        source /usr/share/doc/fzf/examples/key-bindings.zsh
        source /usr/share/doc/fzf/examples/completion.zsh
    fi
fi

# --- Zoxide (smarter cd) ----------------------------------------------------
command -v zoxide &>/dev/null && eval "$(zoxide init zsh)"

# --- Ripgrep config ----------------------------------------------------------
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

# --- Aliases -----------------------------------------------------------------
[ -f "$DOTFILES_DIR/zsh/aliases.zsh" ] && source "$DOTFILES_DIR/zsh/aliases.zsh"

# --- Starship prompt (must be last) ------------------------------------------
command -v starship &>/dev/null && eval "$(starship init zsh)"

# --- Local overrides (not tracked in git) ------------------------------------
[ -f "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"
