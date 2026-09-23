# ==========================================================================
#  .zshrc — Minimal zsh config (no frameworks, no bloat)
# ==========================================================================
#  No Oh My Zsh, no Prezto, no Zinit. Just zsh with the good built-ins
#  turned on and a handful of plugins cloned manually.
#
#  Plugins install themselves on first shell start. To update them:
#    zsh-update-plugins
# ==========================================================================

# ── XDG & paths ─────────────────────────────────────────────────────────
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"

export PATH="$HOME/.local/bin:$HOME/go/bin:$PATH"
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
# ── History ──────────────────────────────────────────────────────────────
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000

setopt HIST_IGNORE_DUPS       # no duplicados consecutivos
setopt HIST_IGNORE_ALL_DUPS   # borra la entrada vieja si se repite
setopt HIST_IGNORE_SPACE      # comandos con espacio al inicio no se graban
setopt HIST_REDUCE_BLANKS     # limpiar espacios sobrantes
setopt SHARE_HISTORY          # compartir historial entre sesiones
setopt APPEND_HISTORY         # no sobreescribir, append
setopt INC_APPEND_HISTORY     # escribir al historial inmediatamente

# ── Opciones generales ──────────────────────────────────────────────────
setopt AUTO_CD                # escribir un directorio = cd a él
setopt AUTO_PUSHD             # cd empuja al stack (popd para volver)
setopt PUSHD_IGNORE_DUPS      # no duplicados en el stack
setopt INTERACTIVE_COMMENTS   # permitir # en línea de comandos
setopt NO_BEEP                # silencio

# ── Completion (built-in, potente) ──────────────────────────────────────
autoload -Uz compinit
# Recompilar zcompdump solo una vez al día (rendimiento)
if [[ -n "$ZSH_COMPDUMP" ]] && [[ $(date +'%j') != $(stat -f '%Sm' -t '%j' "$ZSH_COMPDUMP" 2>/dev/null || stat -c '%Y' "$ZSH_COMPDUMP" 2>/dev/null | xargs -I{} date -d @{} +%j 2>/dev/null) ]]; then
    compinit
else
    compinit -C
fi

zstyle ':completion:*' menu select                       # menú interactivo
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'     # case insensitive
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"  # colores
zstyle ':completion:*' group-name ''                     # agrupar por tipo
zstyle ':completion:*:descriptions' format '%B%F{cyan}── %d ──%f%b'
zstyle ':completion:*:warnings' format '%F{red}no matches%f'

# ── Vi mode ──────────────────────────────────────────────────────────────
bindkey -v
export KEYTIMEOUT=1     # 10ms para secuencias (snappy vi mode)

# Mantener keybinds útiles en vi insert mode
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^K' kill-line
bindkey '^W' backward-kill-word
bindkey '^?' backward-delete-char    # backspace
bindkey '^H' backward-delete-char
bindkey '^R' history-incremental-search-backward

# ── Prompt ──────────────────────────────────────────────────────────────
eval "$(starship init zsh)"

# ── Aliases ──────────────────────────────────────────────────────────────
alias ls='ls --color=auto'
alias ll='ls -lah --color=auto'
alias la='ls -A --color=auto'
alias grep='grep --color=auto'

alias g='git'
alias gs='git status -sb'
alias gl='git log --oneline --graph --decorate -20'
alias gd='git diff'
alias ga='git add'
alias gc='git commit'
alias gp='git push'

alias v='nvim'
alias vim='nvim'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias mk='make -j$(nproc)'
alias mc='make clean'

# lazygit
alias lg='lazygit'

# ── Variables de entorno ────────────────────────────────────────────────
export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'
export LESS='-R --mouse'

# Notas (usado por nz y notes.lua)
export NOTES_DIR="$HOME/notes"

# ── Plugins (auto-instalación, sin framework) ──────────────────────────
ZSH_PLUGIN_DIR="$XDG_DATA_HOME/zsh/plugins"

# Función para clonar un plugin si no existe
_ensure_plugin() {
    local repo="$1"
    local name="${repo##*/}"
    local dir="$ZSH_PLUGIN_DIR/$name"

    if [[ ! -d "$dir" ]]; then
        echo "Installing zsh plugin: $name..."
        git clone --depth=1 "https://github.com/$repo.git" "$dir" 2>/dev/null
    fi

    # Sourcing: buscar el .zsh o .plugin.zsh
    local init
    for init in "$dir/$name.zsh" "$dir/$name.plugin.zsh"; do
        [[ -f "$init" ]] && source "$init" && return
    done
}

_ensure_plugin "zsh-users/zsh-autosuggestions"
_ensure_plugin "zsh-users/zsh-syntax-highlighting"

# Autosuggestions config
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# Función para actualizar plugins
zsh-update-plugins() {
    for dir in "$ZSH_PLUGIN_DIR"/*/; do
        echo "Updating $(basename "$dir")..."
        git -C "$dir" pull --quiet
    done
    echo "Done."
}

# ── fzf integration ────────────────────────────────────────────────────
# fzf key bindings y completion (si está instalado)
if [[ -f /usr/share/fzf/key-bindings.zsh ]]; then
    source /usr/share/fzf/key-bindings.zsh
fi
if [[ -f /usr/share/fzf/completion.zsh ]]; then
    source /usr/share/fzf/completion.zsh
fi

export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d --hidden --exclude .git'
export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'

# ── Hooks ───────────────────────────────────────────────────────────────
autoload -Uz add-zsh-hook

# Cargar .envrc local si existe (tipo direnv pero manual y simple)
_load_local_env() {
    [[ -f .envrc ]] && source .envrc
}
add-zsh-hook chpwd _load_local_env
uvjupyter() {
    local name
    name="$(basename "$PWD")"

    if [[ ! -f pyproject.toml ]]; then
        echo "No pyproject.toml found."
        echo "Run 'uv init' first."
        return 1
    fi

    if [[ ! -d .venv ]]; then
        echo "Creating virtual environment..."
        uv venv
    fi

    echo "Installing Jupyter + ipykernel..."
    uv add jupyter ipykernel

    echo "Registering kernel: $name"
    uv run python -m ipykernel install \
        --user \
        --name "$name" \
        --display-name "Python ($name)"

    echo
    echo "V Jupyter kernel registered: Python ($name)"
}

. "$HOME/.local/share/../bin/env"


# Added by Antigravity CLI installer
export PATH="/home/trappedintesseract/.local/bin:$PATH"

# ── eza Dracula Theme ───────────────────────────────────────────────────
export EZA_COLORS="\
uu=36:\
uR=31:\
un=35:\
gu=37:\
da=2;34:\
ur=34:\
uw=95:\
ux=36:\
ue=36:\
gr=34:\
gw=35:\
gx=36:\
tr=34:\
tw=35:\
tx=36:\
xx=95:"
