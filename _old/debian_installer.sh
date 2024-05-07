#!/bin/bash

if [ "$EUID" -ne 0 ]; then
    echo "EUID is: $EUID"
    echo "This script must be run with sudo."
    exit 1
fi

source "installer_files/global_vars.sh"
source "installer_files/installer_functions.sh"
source "installer_files/installer_loops.sh"


while true; do
    read -p "If you made a mistake please exit with <Ctrl-C>. Otherwise press enter: " choice
    install_choice=$(check_choice "$choice")

    if [ "$install_choice" -eq 1 ]; then
        clear -x
        choice=""
        source "installer_files/installer_callers.sh"
        break
    elif [ "$install_choice" -eq 0 ]; then
        choice=""
        break
    elif [ "$install_choice" -eq 2 ]; then
        choice=""
        continue
    else
        choice=""
        continue
    fi
done
