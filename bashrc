# ~/.bashrc: executed by bash(1) for non-login shells.

##export XIM_ARGS="-d"
AWT_TOOLKIT=MToolkit
export GTK_IM_MODULE="fcitx"
export XMODIFIERS=@im="fcitx"
export QT_IM_MODULE="fcitx"
export XIM="fcitx" 
export XIM_PROGRAM="fcitx"
export PS1="\[\e[1;32m\]\u\[\e[0;34m\]\$(date +%H:%M)\[\e[0;37m\]\w\\$ "
#export PS1='\[\e[1;32m\][\u@\h \W](date +%H:%M)\$\[\e[0m\] '
# prompt
#if [ $USER = 'root' ] ; then
#  COLOUR=41  # red
#else
#  COLOUR=44  # blue
#fi
#ESC="\033"
#PROMPT="\u@\h"  # username@hostname
#STYLE=";1m"  # bold
#STYLE="m"    # plain
#PS1="\[$ESC[$COLOUR;37$STYLE\]$PROMPT:\[$ESC[37;40$STYLE\]\$(date +%H:%M)\w\\$ "
PS2="> "



# enable color support of ls and also add handy aliases
#if [ -x /usr/bin/dircolors ]; then
#    eval "`dircolors -b`"
#    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
#fi


# User specific aliases and functions
#alias rm='rm -i'
#alias mv='mv -i'
#alias cp='cp -i'

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
#alias ls='ls -sh1C --color=tty'
alias ls="ls -s -F -T 0 -b -H -1 -C --color=auto"
alias vi='vim'
alias s='cd ..'
alias p='cd -'
alias df="df -Th"
alias cdin='mount /mnt/cdrom ; cd /mnt/cdrom ; ls'
alias cdout='cd ; umount /mnt/cdrom ; eject'
alias du='du -h --max-depth=1'
alias startx='startx -- -nolisten tcp'
alias netstat='netstat -nap --inet'
#alias ps='ps auxfwww'
alias qq='chromium-browser --app=http://web.qq.com'
alias emacs='emacsclient -t'

eval `dircolors ~/.dircolors`

# Need for a xterm & co if we don't make a -ls
#[ -n $DISPLAY ] && {
#    [ -f /etc/profile.d/color_ls.sh ] && source /etc/profile.d/color_ls.sh
#     export XAUTHORITY=$HOME/.Xauthority
#}

# Read first /etc/inputrc if the variable is not defined, and after the /etc/inputrc 
# include the ~/.inputrc
[ -z $INPUTRC ] && export INPUTRC=/etc/inputrc

umask=022
ulimit -c 0
[ -r /etc/bash_completion ] && . /etc/bash_completion 
# .bashrc
