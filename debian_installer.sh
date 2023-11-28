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

# Installation Choices
while true; do
    read -p "Do you want to start the WM Installation: " choice
    wm_choice=$(check_choice "$wm_choice")
    echo "$wm_choice"

    if [ "$wm_choice" -eq 0 ] || [ "$wm_choice" -eq 1 ]; then
        break
    elif [ "$wm_choice" -eq 2 ]; then
        continue
    else
        continue
    fi
done

# Validating Inputs



# Installer Scripts

