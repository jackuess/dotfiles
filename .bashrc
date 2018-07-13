# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
eval $(dircolors -b)
alias grep='grep --color=auto'

PS1='[\u@\h \W]\$ '

curljson () {
    curl -s -v "$@" | jq
}

# FZF
export FZF_DEFAULT_OPTS='--multi --preview '"'"'[[ $(file --mime {}) =~ binary ]] &&
						    echo {} is a binary file ||
							(pygmentize -f 256 -O style=monokai {} ||
							 cat {}) 2> /dev/null | head -500'"'"
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash

powerline-daemon -q
source /usr/lib/python3.6/site-packages/powerline/bindings/bash/powerline.sh

source /usr/share/doc/pkgfile/command-not-found.bash
