# /etc/skel/.bash_profile

# Ensure XDG_RUNTIME_DIR is set
if test -z "$XDG_RUNTIME_DIR"; then
	export XDG_RUNTIME_DIR=$(mktemp -d /tmp/$(id -u)-runtime-dir.XXX)
fi
# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
if shopt -q login_shell; then
	[[ -f ~/.bashrc ]] && source ~/.bashrc
	[[ -t 0 && $(tty) == /dev/tty1 && ! $DISPLAY ]] && exec startx
else
	exit 1
fi
