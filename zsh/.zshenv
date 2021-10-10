export PATH=$PATH:/usr/local/go/bin:/home/seba/.local/bin:/home/seba/Project/Configz/Scripts

export EDITOR="nvim"
export TERMINAL="Alacritty"
export BROWSER="firefox"


#################CLEANUP########################################################
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}

setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY
export HISTSIZE=2000
export SAVEHIST=500000
export HISTFILE="$HOME/.config/zsh/history"
export ZDOTDIR=~/.config/zsh
export ZSH_DISABLE_COMPFIX='true'
export XAUTHORITY="$XDG_CONFIG_HOME"/Xauthority
export GNUPHOME="$XDG_DATA_HOME"/gnupg
export LESSHISTFILE=-
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export CARGO_HOME="$XDG_DATA_HOME"/cargo        #Car never go school , car big brain

#################Startx Automatically###########################################

if [[ $(tty) = /dev/tty1 ]]
then
    $(startx /home/seba/.config/X11/xinitrc)
fi

. "/home/seba/.local/share/cargo/env"
