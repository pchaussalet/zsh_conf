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

alias pa_mono="pacmd load-module module-remap-sink sink_name=mono master=`pacmd list-sinks | grep name: | grep analog |awk -F'<' '{ print $2 }' |awk -F'>' '{ print $1 }'` channels=2 channel_map=mono,mono"
alias cleanup_id3='for file in *.mp3; do track=`echo $file |awk -F"_" '"'"'{ print $1 }'"'"'`; title=`echo $file |awk -F"_" '"'"'{ print $2 }'"'"' |sed "s/\.mp3$//"`; current=`pwd`; parent=`dirname "$current"`; album=`basename "$current"`; artist=`basename "$parent"`; id3v2 -D $file; id3v2 -T $track -t "$title" -a "$artist" -A "$album" $file ;done'

alias virlxc='virsh -c lxc:///' 
alias virkvm='virsh -c qemu:///system'
alias irc='mosh --ssh="ssh -i ~/.ssh/pchaussalet.pem" arthur@irc.chaussalet.net docker attach irssi'
alias finch='TERM=rxvt finch'

alias apts='apt-cache search'
alias apti='sudo apt-get install'

alias mkpymod='touch __init__.py'
alias vba='. venv/bin/activate'

