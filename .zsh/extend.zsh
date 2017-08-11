# Auto-complete for hidden files
setopt globdots

# fzf integration
if [[ -d /usr/share/fzf ]]; then
	source /usr/share/fzf/key-bindings.zsh
	source /usr/share/fzf/completion.zsh
fi


### FASD
# fasd init
eval "$(fasd --init auto)"

# fasd & fzf change directory - jump using 
# `fasd` if given argument, 
# filter output of `fasd` using `fzf` else
unalias z 2> /dev/null
z() {
    [ $# -gt 0 ] && fasd_cd -d "$*" && return
    local dir
    dir="$(fasd -Rdl "$1" | fzf -1 -0 --no-sort +m)" && cd "${dir}" || return 1
}

# fasd & fzf open with vim - open best 
# matched file using `fasd` if given argument, 
# filter output of `fasd` using `fzf` else
unalias v 2> /dev/null
v() {
    [ $# -gt 0 ] && fasd -f -e ${VISUAL} "$*" && return
    local file
    file="$(fasd -Rfl "$1" | fzf -1 -0 --no-sort +m)" && vim "${file}" || return 1
}
