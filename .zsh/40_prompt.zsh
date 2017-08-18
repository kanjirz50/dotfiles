local p_rhst=""
if [[ -n "${REMOTEHOST}${SSH_CONNECTION}" ]]; then
    local rhost= 'ssh'
    rhost=${rhost#localhost:}
    rhost=${rhost%%.*}
    p_rhst="%B%F{yellow}$rhost%f%b"
fi

local p_cdir="%B%K{cyan}[%~]%k%b"$'\n'
local p_info="%B%K{magenta}[%n@%m${WINDOW:+"[$WINDOW]"}]%k%b"
local p_mark="%B%(?,%F{green},%F{red})%(!,#,%%)%f%b"
PROMPT="$p_cdir$p_rhst$p_info $p_mark "

precmd(){
    PROMPT="%F{blue}┌─%f"
    PROMPT+="%F{blue}[%f%F{yellow}%n%f%F{blue}@%f%F{cyan}%m%f%F{blue}]%f - "
    PROMPT+="[%35<..<%~]"
    PROMPT+=$'\n'
    PROMPT+="%F{blue}└─"
    PROMPT+="[%f$p_mark%F{blue}]%f"
    PROMPT+='%F{magenta}$(__git_ps1 " - [%s]")%f'
    PROMPT+=' '
}

# auto ls after cd command
chpwd() {
    ls_abbrev
}

ls_abbrev() {
    # -a : Do not ignore entries starting with ..
    # -C : Force multi-column output.
    # -F : Append indicator (one of */=>@|) to entries.
    local cmd_ls='ls'
    local -a opt_ls
    opt_ls=('-aCF' '--color=always')
    case "${OSTYPE}" in
        freebsd*|darwin*)
            if type gls > /dev/null 2>&1; then
                cmd_ls='gls'
            else
                # -G : Enable colorized output.
                opt_ls=('-aCFG')
            fi
            ;;
    esac

    local ls_result
    ls_result=$(CLICOLOR_FORCE=1 COLUMNS=$COLUMNS command $cmd_ls ${opt_ls[@]} | sed $'/^\e\[[0-9;]*m$/d')

    local ls_lines=$(echo "$ls_result" | wc -l | tr -d ' ')

    if [ $ls_lines -gt 10 ]; then
        echo "$ls_result" | head -n 5
        echo '...'
        echo "$ls_result" | tail -n 5
        echo "$(command ls -1 -A | wc -l | tr -d ' ') files exist"
    else
        echo "$ls_result"
    fi
}
