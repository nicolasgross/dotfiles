#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PROMPT_DIRTRIM=3
PS1='\e[1;31m\u \e[1;37mat \e[1;33m\h \e[1;37min \e[1;32m\w\e[1;37m\n'
PS1+='\$\e[0m '

alias ls='command ls --color'
alias ll='ls -lF --color'
alias la='ls -laF --color'

alias grep='grep --color=auto'

