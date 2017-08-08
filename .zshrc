if [ -f ~/.zplug/init.zsh ]; then
    # Zplug automatically search zsh files and souce the files.
    export ZPLUG_LOADFILE=~/.zsh/zplug.zsh
    source ~/.zplug/init.zsh

    if ! zplug check --verbose; then
	printf "Install? [y/N]: "
	if read -q; then
	    echo; zplug install
	fi
    fi

    zplug load
fi
