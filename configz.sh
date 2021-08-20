#!/bin/bash

EDITOR="nvim"

# An array of options to choose.
# You can edit this list to add/remove config files.
declare -a options=(
"nvim - $HOME/.config/nvim/init.vim"
"alacritty - $HOME/.config/alacritty/alacritty.yml"
"zsh - $HOME/.config/zsh/.zshrc"
"qtile - $HOME/.config/qtile/config.py"
"picom - $HOME/.config/picom/picom.conf"
"xorg - $HOME/.config/X11/xinitrc"
"quit"
)

# Piping the above array into dmenu.
# We use "printf '%s\n'" to format the array one item to a line.
choice=$(printf '%s\n' "${options[@]}" |rofi -dmenu -i -l 20 -p 'Edit config:')

# What to do when/if we choose 'quit'.
if [[ "$choice" == "quit" ]]; then
    echo "Program terminated." && exit 1

# What to do when/if we choose a file to edit.
elif [ "$choice" ]; then
	cfg=$(printf '%s\n' "${choice}" | awk '{print $NF}')
    echo
	alacritty -e $EDITOR "$cfg"

# What to do if we just escape without choosing anything.
else
    echo "Program terminated." && exit 1
fi

