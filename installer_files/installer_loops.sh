#!/bin/bash

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

while true; do
    read -p "Do you want to install the docker: " choice
    docker_choice=$(check_choice "$choice")

    if [ "$docker_choice" -eq 1 ]; then
        choice=""
        install_docker
        break
    elif [ "$docker_choice" -eq 0 ]; then
        choice=""
        break
    elif [ "$docker_choice" -eq 2 ]; then
        choice=""
        continue
    else
        choice=""
        continue
    fi
done
