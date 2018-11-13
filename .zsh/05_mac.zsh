# pyenv
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

zplug $(pyenv root)/completions/pyenv.zsh, from:local

eval "$(thefuck --alias)"
