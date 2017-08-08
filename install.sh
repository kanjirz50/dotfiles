#!/bin/sh

set -eu

cwd=`dirname "${0}"`
DOTFILES_PATH=`(cd "${cwd}" && pwd)`

# Setup Zplug
if [ -d ${DOTFILES_PATH}/.zplug ];
then
    echo "Zplug has already installed."
else
    echo "Installing Zplug."
    git clone https://github.com/zplug/zplug ${DOTFILES_PATH}/.zplug
fi

# Dotfiles
for f in .??*
do
    # 除外リスト
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue

    ln -snfv ${DOTFILES_PATH}/"${f}" ~/"${f}"
done
