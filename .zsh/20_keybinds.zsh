# Emacs like key bind
bindkey -e

zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# emacsフォアグラウンドトグル切り替え
zle -N foreground-emacs
bindkey '^Z' foreground-emacs
foreground-emacs() {
    fg %emacs
}

# Ctrl+sでfwd-i-search
stty -ixon
