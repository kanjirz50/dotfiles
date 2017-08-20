# pyenv
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"

zplug $(pyenv root)/completions/pyenv.zsh, from:local
