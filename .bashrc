# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

powerline-daemon -q
source /usr/lib/python3.6/site-packages/powerline/bindings/bash/powerline.sh

source /usr/share/doc/pkgfile/command-not-found.bash
