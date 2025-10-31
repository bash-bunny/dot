# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

# Put your fun stuff here.

# Bash shell options
shopt -s checkwinsize # Check window size and enable $COLUMS and $ROWS
shopt -s expand_aliases # Expand aliases
shopt -s globstar # Pattern matching for **
shopt -s histappend # Append history to history file
shopt -s dotglob # Match files starting with . in expansion
shopt -s extglob # Enable Pathname Expansion

# vi mode everywhere
set -o vi # Enable vi mode

# Stty
stty -ixon # Disable control-s/control-q tty flow control

# History
export HISTCONTROL=ignoreboth # Ignore commands that start with space and commands that are duplicated
export HISTSIZE=500
export HISTFILESIZE=1000

# Colours
txtgrn='\[\e[0;32m\]' # Green
txtpur='\[\e[0;35m\]' # Purple
txtwht='\[\e[0;37m\]' # White

# Venv
set_venv() {
    [ -z "$VIRTUAL_ENV" ] && PYTHON_VENV="" || PYTHON_VENV="${txtgrn}[`basename \"$VIRTUAL_ENV\"`]$NONE "
}

source /usr/share/git/completion/git-prompt.sh
# 'Safe' version of __git_ps1 to avoid errors on systems that don't have it
function gitPrompt {
  command -v __git_ps1 > /dev/null && __git_ps1 " (%s)"
}

# Prompt colours
atC="${txtpur}"
nameC="${txtpur}"
hostC="${txtpur}"
pathC="${txtgrn}"
gitC="${txtpur}"
pointerC="${txtgrn}"
normalC="${txtwht}"

# Patent Pending Prompt
#export PS1="${PYTHON_VENV}${nameC}\u${atC}@${hostC}\h:${pathC}\W${gitC}\$(gitPrompt)${pointerC} ▶${normalC} "
export PS1='\[\033[0;31m\][\[\033[1;33m\]$USER\[\033[0;31m\]] \[\033[0;31m\][\[\033[1;33m\]\w\[\033[0;31m\]]\n\[\033[0;32m\]> \[\033[0m\]'

# Env vars
export EDITOR="vim"
export VISUAL="vim"
export TERMINAL="rxvt-unicode-256color"
export BROWSER="qutebrowser"
export READER="zathura"
export FILE="ranger"
export SUDO_ASKPASS="$HOME/.local/bin/dmenupass"
export GITUSER="bash-bunny"
export REPOS="$HOME/Repos"
if [ -f "$HOME/.gf/gf-completion.bash" ]; then
	source "$HOME/.gf/gf-completion.bash"
fi
## CDPATH
export CDPATH=".:$HOME:$HOME/scripts:$HOME/Documents/"
# Libvirt
export LIBVIRT_DEFAULT_URI='qemu:///system'
# Surf browser
export WEBKIT_DISABLE_COMPOSITING_MODE=1

# Enable bash completion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    source /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
  fi
fi

# Functions
clone ()
{
	local repo="$1" user;
	local repo="${repo#https://github.com/}";
	local repo="${repo#git@github.com:}";
	if [[ $repo =~ / ]]; then
		user="${repo%%/*}"
	else
		user="$GITUSER"
	fi
	local name="${repo##*/}"
	local userd="$REPOS/github.com/$user"
	local path="$userd/$name"
	[[ -d "$path" ]] && cd "$path" && return
	mkdir -p "$userd"
	cd "$userd"
	echo gh repo clone "$user/$name" -- --recurse-submodule
	gh repo clone "$user/$name" -- --recurse-submodule
	cd "$name"
} && export -f clone

rdns () {
    curl -m10 -fsSL "https://ip.thc.org/${1:?}?limit=20&f=${2}"
}
# rdns <IP>

sub() {
    [ $# -ne 1 ] && { echo >&2 "crt <domain-name>"; return 255; }
    curl -fsSL "https://crt.sh/?q=${1:?}&output=json" --compressed | jq -r '.[].common_name,.[].name_value' | anew | sed 's/^\*\.//g' | tr '[:upper:]' '[:lower:]'
    curl -fsSL "https://ip.thc.org/sb/${1:?}"
}
# sub <domain>

LFCD="/home/artic/.config/lf/lfcd.sh"
if [ -f "$LFCD" ]; then
	source "$LFCD"
fi

# Load files
## Load aliases
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

# Paths
## local binaries
localbin="$HOME/.local/bin"
if ! [[ $PATH =~ "$localbin" ]]; then
	export PATH="$localbin:$PATH"
fi
## GOLANG
GOPATH="$HOME/go"
if ! [[ $PATH =~ "$GOPATH" ]]; then
	export PATH="$PATH:$GOPATH/bin"
fi
## screenlayout
screenlayout="$HOME/.screenlayout"
if ! [[ $PATH =~ "$screenlayout" ]]; then
	export PATH="$PATH:$screenlayout"
fi
## Rust packages
rustpath="/root/.cargo/bin"
if ! [[ $PATH =~ "$rustpath" ]]; then
	export PATH="$PATH:$rustpath"
fi
## User Rust packages
urustpath="~/.cargo/bin"
if ! [[ $PATH =~ "$urustpath" ]]; then
	export PATH="$PATH:$urustpath"
fi
## Home bin (for ruby packages)
homebin="~/bin"
if ! [[ $PATH =~ "$homebin" ]]; then
	export PATH="$PATH:$homebin"
fi
