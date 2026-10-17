#!/usr/bin/env bash

alias xclip="xclip -selection c"
alias outboundconnections="echo \"netstat -npt | awk '{print $5}' | grep -v \\\"ffff\\\\|127\\\\.0\\\\.0\\\\.1\\\" | sort -n | uniq -c | sort -n\""
alias sb="source ~/.bashrc"
alias lsa="ls -alh"
alias ncat="cat -n"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    alias copy_to_clipboard="xclip"
elif [[ "$OSTYPE" == "darwin"* ]]; then
        # Mac OSX
    alias copy_to_clipboard="pbcopy"
# elif [[ "$OSTYPE" == "cygwin" ]]; then
        # POSIX compatibility layer and Linux environment emulation for Windows
# elif [[ "$OSTYPE" == "msys" ]]; then
        # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
# elif [[ "$OSTYPE" == "win32" ]]; then
        # I'm not sure this can happen.
# elif [[ "$OSTYPE" == "freebsd"* ]]; then
        # ...
# else
        # Unknown.
fi
