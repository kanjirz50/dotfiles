# cd先をディレクトリスタックに追加
setopt auto_pushd
# auto_cd
setopt auto_cd
setopt correct
setopt list_packed
setopt nolistbeep

setopt auto_param_slash      # ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt mark_dirs             # ファイル名の展開でディレクトリにマッチした場合 末尾に / を付加
setopt auto_param_keys       # カッコの対応などを自動的に補完

setopt share_history        # share command history data
setopt hist_expand # 補完時にヒストリを自動的に展開

setopt HIST_IGNORE_DUPS   # 前と重複する行は記録しない
setopt HIST_FIND_NO_DUPS  # 履歴検索中、(連続してなくとも)重複を飛ばす
setopt HIST_REDUCE_BLANKS # 余分な空白は詰めて記録

# redirect_opt
setopt multios

# PROMPT表示設定
setopt PROMPT_SUBST