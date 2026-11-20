[[ -o interactive ]] || return

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'
export LESS='-R --mouse'
export NOTES_DIR="$HOME/notes"
export CLAUDE_CODE_DISABLE_EXPERIMENTAL_BETAS=1

if [[ -d /opt/homebrew/bin ]]; then
  export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
elif [[ -d /usr/local/bin ]]; then
  export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
fi

export PATH="$HOME/.local/bin:$HOME/go/bin:$PATH"
[[ -d /opt/nvim-linux-x86_64/bin ]] && export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
[[ -f "$HOME/.local/bin/env" ]] && source "$HOME/.local/bin/env"
export MAKEFLAGS="-j$(getconf _NPROCESSORS_ONLN 2>/dev/null || printf '1')"

HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=25000

setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt EXTENDED_GLOB
setopt INTERACTIVE_COMMENTS
setopt GLOB_DOTS
setopt NO_CASE_GLOB
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt NO_BEEP

autoload -Uz compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh-24) ]]; then
  compinit -C
else
  compinit
  touch "${ZDOTDIR:-$HOME}/.zcompdump"
fi

zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*:warnings' format '%F{red}no matches%f'

bindkey -v
export KEYTIMEOUT=40

autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey '^[[A' history-beginning-search-backward-end
bindkey '^[[B' history-beginning-search-forward-end
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^K' kill-line
bindkey '^W' backward-kill-word
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char
bindkey '^R' history-incremental-search-backward

alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -I'
alias ln='ln -v'
alias df='df -h'

if command -v eza >/dev/null; then
  alias ls='eza --icons --group-directories-first'
  alias ll='eza --icons -l --git'
  alias la='eza --icons -la --git'
elif [[ "$OSTYPE" == darwin* ]]; then
  alias ls='ls -G'
  alias ll='ls -lh'
  alias la='ls -A'
else
  alias ls='ls --color=auto'
  alias ll='ls -lah --color=auto'
  alias la='ls -A --color=auto'
fi

alias grep='grep --color=auto'
alias g='git'
alias gs='git status -sb'
alias gl='git log --oneline --graph --decorate -20'
alias gd='git diff'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias lg='lazygit'
alias v='nvim'
alias vim='nvim'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias mk='make -j$(getconf _NPROCESSORS_ONLN)'
alias mc='make clean'

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

wthr() {
  if [[ "$1" == "-s" ]]; then
    shift
    curl "wttr.in/${(j:+:)@}?format=%c+%t"
  else
    curl "wttr.in/${(j:+:)@}"
  fi
}

export VENV_HOME="$HOME/.virtualenvs"
[[ -d "$VENV_HOME" ]] || mkdir -p "$VENV_HOME"

lsvenv() { ls -1 "$VENV_HOME"; }

venv() {
  [[ $# -eq 1 ]] && source "$VENV_HOME/$1/bin/activate" || echo "Usage: venv <name>"
}

mkvenv() {
  [[ $# -eq 1 ]] && python3 -m venv "$VENV_HOME/$1" || echo "Usage: mkvenv <name>"
}

rmvenv() {
  [[ $# -eq 1 ]] && command rm -rf "$VENV_HOME/$1" || echo "Usage: rmvenv <name>"
}

mkker() {
  [[ $# -eq 1 ]] || { echo "Usage: mkker <kernel-name>"; return 1; }
  python -m pip install -U ipykernel && python -m ipykernel install --user --name "$1" --display-name "Python ($1)"
}

nvimvenv() {
  local venv_path project_root nvim_file=".nvim.lua"

  if [[ -n "$1" ]]; then
    venv_path="$VENV_HOME/$1/bin/python"
  elif [[ -n "$VIRTUAL_ENV" ]]; then
    venv_path="$VIRTUAL_ENV/bin/python"
  else
    echo "No venv active"
    return 1
  fi

  project_root=$(git rev-parse --show-toplevel 2>/dev/null || pwd)

  cat > "$project_root/$nvim_file" <<EOF
vim.g.project_python = "$venv_path"
vim.g.python_host_prog = nil
EOF

  echo "Created $project_root/$nvim_file"
}

runc() {
  [[ $# -ge 1 ]] || { echo "Usage: runc <file.cpp>"; return 1; }
  local gxx=g++ c
  for c in g++-15 g++-14 g++-13; do
    command -v "$c" >/dev/null && { gxx="$c"; break; }
  done
  "$gxx" -std=c++20 -O2 "$1" -o a.out && ./a.out
}

mkcd() { mkdir -p "$1" && cd "$1"; }

if command -v starship >/dev/null; then
  _starship_cache="$HOME/.starship-init.zsh"
  [[ ! -f "$_starship_cache" || "$(command -v starship)" -nt "$_starship_cache" ]] && starship init zsh --print-full-init >! "$_starship_cache"
  source "$_starship_cache"
fi

export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d --hidden --exclude .git'
export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'

if [[ "$OSTYPE" == darwin* ]] && command -v fzf >/dev/null; then
  _fzf_cache="$HOME/.fzf-init.zsh"
  fzf --zsh >! "$_fzf_cache"
  source "$_fzf_cache"
else
  [[ -f /usr/share/fzf/key-bindings.zsh ]] && source /usr/share/fzf/key-bindings.zsh
  [[ -f /usr/share/fzf/completion.zsh ]] && source /usr/share/fzf/completion.zsh
fi

autoload -Uz add-zsh-hook
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
  uv run python -m ipykernel install --user --name "$name" --display-name "Python ($name)"
  echo "Jupyter kernel registered: Python ($name)"
}

ZSH_PLUGIN_DIR="$XDG_DATA_HOME/zsh/plugins"

_ensure_plugin() {
  local repo="$1"
  local name="${repo##*/}"
  local dir="$ZSH_PLUGIN_DIR/$name"
  local init

  if [[ ! -d "$dir" ]]; then
    echo "Installing zsh plugin: $name..."
    git clone --depth=1 "https://github.com/$repo.git" "$dir" 2>/dev/null
  fi

  for init in "$dir/$name.zsh" "$dir/$name.plugin.zsh"; do
    [[ -f "$init" ]] && source "$init" && return
  done
}

zsh-update-plugins() {
  local dir
  for dir in "$ZSH_PLUGIN_DIR"/*/; do
    [[ -d "$dir" ]] || continue
    echo "Updating $(basename "$dir")..."
    git -C "$dir" pull --quiet
  done
}

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

if command -v brew >/dev/null; then
  _brew_share="$(brew --prefix)/share"
else
  _brew_share=''
fi

if [[ -n "$_brew_share" && -f "$_brew_share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]]; then
  source "$_brew_share/zsh-autosuggestions/zsh-autosuggestions.zsh"
else
  _ensure_plugin "zsh-users/zsh-autosuggestions"
fi

if [[ -n "$_brew_share" && -f "$_brew_share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
  source "$_brew_share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
else
  _ensure_plugin "zsh-users/zsh-syntax-highlighting"
fi

unset _starship_cache _fzf_cache _brew_share
