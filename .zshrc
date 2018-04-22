source $HOME/.zsh/include.zsh

if type vg > /dev/null; then
        command -v vg >/dev/null 2>&1 && eval "$(vg eval --shell zsh)"
fi
