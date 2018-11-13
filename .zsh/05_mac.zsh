# pyenv
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

zplug $(pyenv root)/completions/pyenv.zsh, from:local

if [ -x "`whence thefuck`" ]; then
   eval "$(thefuck --alias)"
fi