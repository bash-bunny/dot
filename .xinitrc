#!/bin/sh

# xinitrc runs automatically when you run startx
[ -f ~/.xprofile ] && . "$HOME/.xprofile"

# urxvt settings
[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources
eval "$(dbus-launch --sh-syntax --exit-with-session spectrwm)"

# Here we run the proper command to run when the graphical environment starts
exec spectrwm
