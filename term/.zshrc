export ZSH="$HOME/.oh-my-zsh"

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  # ssh-agent
)

# gpg-agent-ssh settings for the terminal to know the socket and use tty
# export GPG_TTY=$(tty)
# export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

# zstyle :omz:plugins:ssh-agent quiet yes
# zstyle :omz:plugins:ssh-agent lazy yes

source $ZSH/oh-my-zsh.sh

# Use fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source <(fzf --zsh)

# PATH
path+=("$HOME/texlive/2025/bin/x86_64-linux")
path+=("$HOME/.local/scripts")
export PATH 

export MANPATH="$MANTPATH:$HOME/texlive/2025/texmf-dist/doc/man"
export INFOPATH="$INFOPATH:$HOME/texlive/2025/texmf-dist/doc/info"

# Functions
mkcdir ()
{
    mkdir -p -- "$1" &&
       cd -P -- "$1"
}

cdfzf ()
{
    local selected_dir=$(find ~ -mindepth 1 -type d -not -path '*/.git*' 2> /dev/null | fzf +m --height 50% --border)
    if [[ -n "$selected_dir" ]]; then
        # Change to the selected directory
        cd "$selected_dir" || return 1
    fi
}

pms ()
{
    podman start -ia "$1"
}

pmc ()
{
    podman exec -it "$1" zsh
}

bindkey -s ^f "tmux-sessionizer\n"

# Aliases
alias zshconfig="nvim ~/.zshrc"
alias python=python3
alias py=python3
alias lsa="ls -Alh --group-directories-first --color=auto"
alias pm=podman
alias cdd=cdfzf
alias img="kitten icat"
alias penstart="sudo virsh start ParrotHTB"
alias penstop="sudo virsh shutdown ParrotHTB"
alias monitors="hyprdynamicmonitors tui --disable-power-events"

eval "$(starship init zsh)"


# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '/home/jdumas/.opam/opam-init/init.zsh' ]] || source '/home/jdumas/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration
