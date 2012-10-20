# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


alias nautilus='nautilus --no-desktop'
alias virlxc='virsh -c lxc:///' 
alias virkvm='virsh -c qemu:///system'
alias irc='ssh -t arthur@chaussalet.net screen -d -R'
alias finch='TERM=rxvt finch'

alias apts='apt-cache search'
alias apti='sudo apt-get install'

alias mkpymod='touch __init__.py'
alias vba='. venv/bin/activate'

