#!/usr/bin/env bash
#xsetroot -solid black &
#feh -bg-scale /home/ming/myscripts/lan.jpg &
#eval `cat $HOME/.fehbg`
#setxkbmap pl &
#export XMODIFIERS=@im=fcitx
#export GTK_IM_MODULE=fcitx
    export LANG=zh_CN.UTF-8
    export LC_CTYPE=zh_CN.UTF-8
    export XMODIFIERS="@im=fcitx"
    export GTK_IM_MODULE=xim
    export GTK_IM_MODULE=fcitx
    export QT_IM_SWITCHER=imsw-multi
    export QT_IM_MODULE=xim
    export QT_IM_MODULE=fcitx
#xrdb -merge /home/ming/.Xresources
xrdb        ~/.Xrsources &
#fcitx-daemon -d -x
fcitx -d
#trayer --edge top --align right --widthtype request --height 20 &
# --SetDockType true --transparent true --alpha 255 --tint 0x00ff00 &
#conky -x 0 -y 580 &
#while true 
#do
#    xsetroot -name  "$(date +"%a %b %d %r")"
#    sleep 1s
#done &
#exec /usr/bin/awesome
#exec /usr/local/bin/dwm
#exec tint2 &
#exec startkde
exec openbox-session
#exec gnome-shell
