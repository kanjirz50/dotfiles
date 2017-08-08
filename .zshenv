# fpathの設定
typeset -gx -U fpath
fpath=( \
    ~/.zsh/completion(N-/) \
    $fpath \
)

# autoload
autoload -Uz compinit && compinit -z
autoload -Uz colors && colors
autoload history-search-end

# LANG
export LANG=ja_JP.UTF-8

# EDITOR
export EDITOR=emacs

# 「/」も単語区切りとみなす。 C-wで/まで削除。ディレクトリ操作が楽？
WORDCHARS=${WORDCHARS:s,/,,}

# Terminal colors
export TERM="xterm-256color"
unset LSCOLORS
export LSCOLORS=GxFxCxdxBxegedabagacad
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# command_history
export HISTFILE=~/.zsh_history
export HISTSIZE=1000000
export SAVEHIST=1000000

# オプションを読むために必要
setopt extended_glob
