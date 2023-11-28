#!/bin/bash


if [ "$EUID" -ne 0 ]; then
    echo "EUID is: $EUID"
    echo "This script must be run with sudo."
    exit 1
fi

# Global Vars
wm_choice=""
snap_choice=""

docker_choice=""
npm_choice=""
python_choice=""
arduino_choice=""

whatsapp_choice=""
onenote_choice=""

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

# Installer Scripts

install_wm() {
    clear  

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

}

# Installation Choices
while true; do
    read -p "Do you want to start the WM Installation: " choice
    wm_choice=$(check_choice "$wm_choice")

    if [ "$wm_choice" -eq 1 ]; then
        install_wm
        break
    elif [ "$wm_choice" -eq 0 ]; then
        break
    elif [ "$wm_choice" -eq 2 ]; then
        continue
    else
        continue
    fi
done

while true; do
    read -p "Do you want to load my configs for the WM: " choice
    wm_choice=$(check_choice "$wm_choice")

    if [ "$wm_choice" -eq 1 ]; then
        configure_wm
        break
    elif [ "$wm_choice" -eq 0 ]; then
        break
    elif [ "$wm_choice" -eq 2 ]; then
        continue
    else
        continue
    fi
done

