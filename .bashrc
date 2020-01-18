#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PROMPT_DIRTRIM=3
PS1='\n'
PS1+='\[\e[1;31m\]\u '
PS1+='\[\e[1;37m\]at '
PS1+='\[\e[1;33m\]\h '
PS1+='\[\e[1;37m\]in '
PS1+='\[\e[1;32m\]\w'
PS1+='\n'
PS1+='\[\e[0m\]\$ '

alias ls='command ls --color'
alias ll='ls -lF --color'
alias la='ls -laF --color'

alias grep='grep --color=auto'

