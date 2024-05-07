#! /usr/bin/env bash

if [ "$EUID" -ne 0 ]; then
    echo "EUID is: $EUID"
    echo "This script must be run with sudo."
    exit 1
fi

# Example config
# cp -r /home/julius/.config/ ./ & 
# echo -e " \xE2\x9C\x94" & 

# hosts config
cp /etc/hosts ./.config/ & 
echo -e "host entries \xE2\x9C\x94" & 

# tmux config
cp /home/julius/.tmux.conf ./ & 
echo -e "Tmux \xE2\x9C\x94" & 

# Fonts
# cp -r /home/julius/.fonts/ ./ & 
echo -e "Fonts \xE2\x9C\x94" & 

# Bspwm config
cp -r /home/julius/.config/bspwm/ ./.config/ & 
echo -e "Bspwm \xE2\x9C\x94" & 

# Neofetch config
cp -r /home/julius/.config/neofetch/ ./.config/ & 
echo -e "Neofetch \xE2\x9C\x94" & 

# NeoVim config
cp -r /home/julius/.config/nvim/ ./.config/ & 
echo -e "NeoVim \xE2\x9C\x94" & 

# Picom config
cp -r /home/julius/.config/picom/ ./.config/ & 
echo -e "Picom \xE2\x9C\x94" & 

# Polybar config
cp -r /home/julius/.config/polybar/ ./.config/ & 
echo -e "Polybar \xE2\x9C\x94" & 

# Rofi config
cp -r /home/julius/.config/rofi/ ./.config/ & 
echo -e "Rofi \xE2\x9C\x94" & 

# Sxhkd config
cp -r /home/julius/.config/sxhkd/ ./.config/ & 
echo -e "Sxhkd \xE2\x9C\x94" & 

# Xfce4-Terminal config
cp -r /home/julius/.config/xfce4/ ./.config/ & 
echo -e "Xfce4 Terminal \xE2\x9C\x94" & 

# Bash config
cp -r /home/julius/.bashrc ./.config/ & 
echo -e "Bash config \xE2\x9C\x94" & 


# Nu config
cp -r /home/julius/.config/nushell/ ./.config/ & 
echo -e "Nushell config \xE2\x9C\x94" & 
