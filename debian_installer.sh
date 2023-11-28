#!/bin/bash


if [ "$EUID" -ne 0 ]; then
    echo "EUID is: $EUID"
    echo "This script must be run with sudo."
    exit 1
fi

# Global Vars
wm_choice=""
wm_config_choice=""
snap_choice=""
xfce_choice=""

docker_choice=""
npm_choice=""
python_choice=""
arduino_choice=""

whatsapp_choice=""
onenote_choice=""

# Installer Functions

check_choice() {
    local choice=$choice
    local result

    case "$choice" in
        [yY])
            result=1
            ;;
        [nN])
            result=0
            ;;
        "")
            result=1
            ;;
        *)
            result=2
            ;;
    esac
    
    echo "$result"

}

install_wm() {
    echo "Installing the Window Manager: "
    # sudo apt install bspwm -y &> /dev/null
    echo -e "Bspwm \xE2\x9C\x94"  
    # sudo apt install sxhkd -y &> /dev/null
    echo -e "Sxhkd \xE2\x9C\x94"  
    # sudo apt install polybar -y &> /dev/null
    echo -e "Polybar \xE2\x9C\x94"  
    # sudo apt install compton -y &> /dev/null
    echo -e "Compton \xE2\x9C\x94"  
    # sudo apt install rofi -y &> /dev/null
    echo -e "Rofi \xE2\x9C\x94"  
    # sudo apt install dunst -y &> /dev/null
    echo -e "Dunst \xE2\x9C\x94"  
    # sudo apt install nitrogen -y &> /dev/null
    echo -e "Nitrogen \xE2\x9C\x94"  
    # sudo apt install i3lock -y &> /dev/null
    echo -e "i3lock \xE2\x9C\x94"  
    # sudo apt install redshift -y &> /dev/null
    echo -e "Redshift \xE2\x9C\x94"  
    # sudo apt install cmus -y &> /dev/null
    echo -e "Cmus \xE2\x9C\x94"  
    # sudo apt install ranger -y &> /dev/null
    echo -e "Ranger \xE2\x9C\x94"  
    # sudo apt install picom -y &> /dev/null
    echo -e "Picom \xE2\x9C\x94"  

    while true; do
        read -p "Do you want to load my configs for the WM: " choice
        wm_config_choice=$(check_choice "$choice")

        if [ "$wm_config_choice" -eq 1 ]; then
            choice=""
            configure_wm
            break
        elif [ "$wm_config_choice" -eq 0 ]; then
            choice=""
            break
        elif [ "$wm_config_choice" -eq 2 ]; then
            choice=""
            continue
        else
            choice=""
            continue
        fi
    done
}

configure_wm() {
    echo "Configuring the Window Manager: "
    # cp -r ./.config/bspwm ~/.config/
    echo -e "Bspwm config loaded \xE2\x9C\x94"  
    # cp -r ./.config/sxhkd/ ~/.config/
    echo -e "Sxhkd config loaded \xE2\x9C\x94"  
    # cp -r ./.config/polybar/ ~/.config/
    echo -e "Polybar config loaded \xE2\x9C\x94"  
    # cp -r ./.config/rofi/ ~/.config/
    echo -e "Rofi config loaded \xE2\x9C\x94"  
    # cp -r ./.config/picom/ ~/.config/
    echo -e "Picom config loaded \xE2\x9C\x94"  
}

install_snap() {
    sudo apt install snap -y &> /dev/null
    echo -e "Snapstore installed \xE2\x9C\x94"  
}

install_xfce() {
    sudo apt install xfce4-terminal -y &> /dev/null
    echo -e "XFCE4 installed \xE2\x9C\x94"  

    while true; do
        read -p "Do you want to load my configs for the terminal: " choice
        xfce_choice=$(check_choice "$choice")

        if [ "$xfce_choice" -eq 1 ]; then
            choice=""
            configure_xfce
            break
        elif [ "$xfce_choice" -eq 0 ]; then
            choice=""
            break
        elif [ "$xfce_choice" -eq 2 ]; then
            choice=""
            continue
        else
            choice=""
            continue
        fi
    done
}
configure_xfce() {
    # cp -r ./.config/xfce4 ~/.config
    echo -e "XFCE4 configured \xE2\x9C\x94"  

}

## Install wm
while true; do
    read -p "Do you want to start the WM Installation: " choice
    wm_choice=$(check_choice "$choice")

    if [ "$wm_choice" -eq 1 ]; then
        choice=""
        install_wm
        break
    elif [ "$wm_choice" -eq 0 ]; then
        choice=""
        break
    elif [ "$wm_choice" -eq 2 ]; then
        choice=""
        continue
    else
        choice=""
        continue
    fi
done

while true; do
    read -p "Do you want to install snap: " choice
    snap_choice=$(check_choice "$choice")

    if [ "$snap_choice" -eq 1 ]; then
        choice=""
        install_snap
        break
    elif [ "$snap_choice" -eq 0 ]; then
        choice=""
        break
    elif [ "$snap_choice" -eq 2 ]; then
        choice=""
        continue
    else
        choice=""
        continue
    fi
done

while true; do
    read -p "Do you want to install the xfce4 terminal: " choice
    xfce_choice=$(check_choice "$choice")

    if [ "$xfce_choice" -eq 1 ]; then
        choice=""
        install_xfce
        break
    elif [ "$xfce_choice" -eq 0 ]; then
        choice=""
        break
    elif [ "$xfce_choice" -eq 2 ]; then
        choice=""
        continue
    else
        choice=""
        continue
    fi
done
