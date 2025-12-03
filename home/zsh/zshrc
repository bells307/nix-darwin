# Minimal .zshrc for remote servers (zsh 5.0.2+)

# History configuration
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY          # Append to history file
setopt SHARE_HISTORY           # Share history between sessions
setopt HIST_IGNORE_DUPS        # Don't record duplicate entries
setopt HIST_IGNORE_SPACE       # Don't record commands starting with space
setopt HIST_REDUCE_BLANKS      # Remove superfluous blanks

# Directory navigation
setopt AUTO_CD                 # cd by just typing directory name
setopt AUTO_PUSHD              # Push directories onto stack
setopt PUSHD_IGNORE_DUPS       # Don't push duplicates
setopt PUSHD_SILENT            # Don't print directory stack

# Completion system
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select                          # Interactive menu
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'        # Case-insensitive
zstyle ':completion:*' list-colors ''                       # Colored completion
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
setopt COMPLETE_IN_WORD        # Complete from cursor position
setopt ALWAYS_TO_END           # Move cursor after completion

# Key bindings (vim mode)
bindkey -v
export KEYTIMEOUT=1                                        # Fast mode switching (10ms)

# History substring search (built-in)
autoload -U up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Essential keys for insert mode
bindkey -v '^?' backward-delete-char                       # Backspace
bindkey -v '^H' backward-delete-char                       # Backspace (alternative)
bindkey -v '^W' backward-kill-word                         # Ctrl+W delete word
bindkey -v '^U' backward-kill-line                         # Ctrl+U delete line
bindkey -v '^A' beginning-of-line                          # Ctrl+A start
bindkey -v '^E' end-of-line                                # Ctrl+E end
bindkey -v '^R' history-incremental-search-backward        # Ctrl+R search
bindkey -v '^P' up-line-or-beginning-search                # Ctrl+P previous command (substring)
bindkey -v '^N' down-line-or-beginning-search              # Ctrl+N next command (substring)
bindkey -v '^Y' accept-line                                # Ctrl+Y accept/execute
bindkey -v '^[[A' up-line-or-beginning-search              # Up arrow (substring)
bindkey -v '^[[B' down-line-or-beginning-search            # Down arrow (substring)
bindkey -v '^[[H' beginning-of-line                        # Home
bindkey -v '^[[F' end-of-line                              # End
bindkey -v '^[[3~' delete-char                             # Delete

# Normal mode bindings
bindkey -a 'k' up-line-or-beginning-search                 # k for search up (substring)
bindkey -a 'j' down-line-or-beginning-search               # j for search down (substring)

# Aliases
alias cd="z"
alias ls="ls --color"
alias y=yazi
alias v=nvim
alias t=tmux
alias c=clear
alias g=git
alias lg=lazygit
alias ll="ls -lAh"
alias la="ls -A"
alias ..="cd .."
alias ...="cd ../.."
alias grep="grep --color=auto"
alias h="history"
alias dirs="dirs -v"

# Prompt with vim mode indicator
setopt PROMPT_SUBST

# Vim mode indicator
function zle-line-init zle-keymap-select {
    VIM_PROMPT="%F{yellow}[NORMAL]%f"
    PROMPT='${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}%F{green}%n@%m%f:%F{blue}%~%f%# '
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

PROMPT='%F{green}%n@%m%f:%F{blue}%~%f%# '

# Enable colored output
export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd

setopt INTERACTIVE_COMMENTS    # Allow comments in interactive mode
setopt NO_BEEP                 # No beep on errors
setopt LONG_LIST_JOBS          # Show jobs in long format
setopt NOTIFY                  # Report status immediately

export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$PATH"
export EDITOR=nvim

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
eval "$(direnv hook zsh)"

# Load local customizations if they exist
[ -f ~/.zshrc-server.local ] && source ~/.zshrc-server.local
