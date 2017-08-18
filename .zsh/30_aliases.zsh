# alias

# ロケール
alias sort="LC_ALL=C sort"
alias uniq="LC_ALL=C uniq"
alias grep="LC_ALL=C grep"

# コマンドのオプションのデフォルト化
alias ls="ls -G"
alias less="less -M"

# emacs client
alias e='emacsclient -nw -a ""'
alias ekill='emacsclient -e "(kill-emacs)"'

# lessでsytanx highlight
function code_less() {
    pygmentize -O style=monokai -f console256 -g $1 | less -iNRM
}
