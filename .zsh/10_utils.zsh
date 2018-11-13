# Zle
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line

# 変数の添字を補完する
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

zstyle ':completion:*' use-cache true
zstyle ':completion:*' list-separator '-->'

# 補完候補をハイライト
zstyle ':completion:*:default' menu select=2

# 補完候補に色を付ける
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

function _pip_completion {
    local words cword
    read -Ac words
    read -cn cword
    reply=( $( COMP_WORDS="$words[*]" \
        COMP_CWORD=$(( cword-1 )) \
        PIP_AUTO_COMPLETE=1 $words[1] ) )
}
compctl -K _pip_completion pip

# fzfによる
function select-history() {
    BUFFER=$(history -n -r 1 | fzf --no-sort +m --query "$LBUFFER" --prompt="History > ")
    CURSOR=$#BUFFER
}

if [ -x "`whence fzf`" ]; then
   echo "fzf settings"
   zle -N select-history
   bindkey '^r' select-history
fi
