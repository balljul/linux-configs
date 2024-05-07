#!/bin/bash

if [ "$wm_choice" -eq 1 ]; then
   install_wm 
fi
if [ "$snap_choice" -eq 1 ]; then
    install_snap
fi
if [ "$xfce_choice" -eq 1 ]; then
    install_xfce
fi
if [ "$docker_choice" -eq 1 ]; then
    install_docker
fi
if [ "$npm_choice" -eq 1 ]; then
    install_npm
fi
if [ "$python_choice" -eq 1 ]; then
    install_python
fi
if [ "$arduino_choice" -eq 1 ]; then
    install_arduino
fi
if [ "$cargo_choice" -eq 1 ]; then
    install_cargo
fi
if [ "$neofetch_choice" -eq 1 ]; then
    install_neofetch
fi
if [ "$htop_choice" -eq 1 ]; then
    install_htop
fi
