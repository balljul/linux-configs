#!/bin/bash

if [ "$EUID" -ne 0 ]; then
    echo "EUID is: $EUID"
    echo "This script must be run with sudo."
    exit 1
fi

source "installer_files/global_vars.sh"
source "installer_files/installer_functions.sh"
source "installer_files/installer_loops.sh"

