# 最初にzplugを読み込む
zplug "zplug/zplug", hook-build:'zplug --self-manage'

# completionのシェルスクリプトはz先に読み込む必要がある（sh設定ファイルで読み込むため。）
zplug "~/.zsh/completion", from:local, use:"*.sh"
zplug "~/.zsh", from:local, use:"<->_*.zsh"

# zshのプラグイン
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions"
