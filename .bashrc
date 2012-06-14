MY_INT=$HOME/Projects/Monitor/integration
INT_ANTARESB=$MY_INT/antaresb/Current/BIND/ENG
INT_DASHER=$MY_INT/dasher/Current/BIND/ENG
INT_OLYMPUSA=$MY_INT/olympusa/Current/BIND/ENG
INT_MP90=$MY_INT/MP90/Current/BIND/ENG

export EDITOR=vim
export DDD=gdb
export http_proxy="http://pixs00.bbl.ms.philips.com:8080"
export https_proxy="http://pixs00.bbl.ms.philips.com:8080"
export ftp_proxy="http://pixs00.bbl.ms.philips.com:8080"
export PAGER="~/bin/vimpager"
export NOSE_REDNOSE=1

alias wremove="wremove -A"
alias ls="ls --color"
alias ll="ls -hl"
#alias modules="cd /home/m5/sw/modules/sources"
alias mymod="cd $HOME/Projects/Monitor/modules/"
alias m5="cd /home/m5"
alias myint="cd $MY_INT"

alias int_antaresb="cd $INT_ANTARESB"
alias int_dasher="cd $INT_DASHER"
alias int_olympusa="cd $INT_OLYMPUSA"
alias int_mp90="cd $INT_MP90"

alias utility="cd /home/m5/sw/utility/Current"
alias nls="cd /home/m5/sw/nls"
alias echo="echo -e"
alias open="gnome-open"
alias ssh='ssh -XY'
alias gvim='gvim -f'
alias less=$PAGER
alias zless=$PAGER
alias make="make -j 8"

#UBUNTU BASHRC
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi


export TERM="xterm-256color"
# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    #http://www.mahner.org/posts/git-branch-im-bash-prompt-anzeigen/
    PS1='\[\033[01;37m\]\u@\h\[\033[01;95m\] \w\[\033[1;33m\]$(__git_ps1 " (%s)")\[\033[01;95m\]$\[\033[00m\] '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi


if [ -f /home/m5/sw/tool/bin/setenvdelphi ] ; then
    . /home/m5/sw/tool/bin/setenvdelphi
fi


export LS_COLORS='di=1;95'
