#!/bin/bash

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
    sudo apt install bspwm -y &> /dev/null
    echo -e "Bspwm \xE2\x9C\x94"  
    sudo apt install sxhkd -y &> /dev/null
    echo -e "Sxhkd \xE2\x9C\x94"  
    sudo apt install polybar -y &> /dev/null
    echo -e "Polybar \xE2\x9C\x94"  
    sudo apt install compton -y &> /dev/null
    echo -e "Compton \xE2\x9C\x94"  
    sudo apt install rofi -y &> /dev/null
    echo -e "Rofi \xE2\x9C\x94"  
    sudo apt install dunst -y &> /dev/null
    echo -e "Dunst \xE2\x9C\x94"  
    sudo apt install nitrogen -y &> /dev/null
    echo -e "Nitrogen \xE2\x9C\x94"  
    sudo apt install i3lock -y &> /dev/null
    echo -e "i3lock \xE2\x9C\x94"  
    sudo apt install redshift -y &> /dev/null
    echo -e "Redshift \xE2\x9C\x94"  
    sudo apt install cmus -y &> /dev/null
    echo -e "Cmus \xE2\x9C\x94"  
    sudo apt install ranger -y &> /dev/null
    echo -e "Ranger \xE2\x9C\x94"  
    sudo apt install picom -y &> /dev/null
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
    cp -r ./.config/bspwm ~/.config/
    echo -e "Bspwm config loaded \xE2\x9C\x94"  
    cp -r ./.config/sxhkd/ ~/.config/
    echo -e "Sxhkd config loaded \xE2\x9C\x94"  
    cp -r ./.config/polybar/ ~/.config/
    echo -e "Polybar config loaded \xE2\x9C\x94"  
    cp -r ./.config/rofi/ ~/.config/
    echo -e "Rofi config loaded \xE2\x9C\x94"  
    cp -r ./.config/picom/ ~/.config/
    echo -e "Picom config loaded \xE2\x9C\x94"  
    chmod u+x ~/.config/bspwm/bspwmrc
}

install_snap() {
    sudo apt install snapd -y &> /dev/null
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
    cp -r ./.config/xfce4 ~/.config
    echo -e "XFCE4 configured \xE2\x9C\x94"  
}

install_docker() {
    sudo apt-get update &> /dev/null
    sudo apt-get install ca-certificates curl gnupg -y &> /dev/null
    sudo install -m 0755 -d /etc/apt/keyrings &> /dev/null
    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg &> /dev/null
    sudo chmod a+r /etc/apt/keyrings/docker.gpg
    echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
        $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
        sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update &> /dev/null
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y &> /dev/null
    echo -e "Docker installed \xE2\x9C\x94"  
    echo "Docker will be tested now"
    sudo docker run hello-world
    
    while true; do
        read -p "Do you want to autoconfigure docker: " choice
        docker_config_choice=$(check_choice "$choice")

        if [ "$docker_config_choice" -eq 1 ]; then
            choice=""
            configure_docker
            break
        elif [ "$docker_config_choice" -eq 0 ]; then
            choice=""
            break
        elif [ "$docker_config_choice" -eq 2 ]; then
            choice=""
            continue
        else
            choice=""
            continue
        fi
    done
}
configure_docker() {
    sudo groupadd docker
    sudo usermod -aG docker $USER
    newgrp docker
    sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
    sudo chmod g+rwx "$HOME/.docker" -R
    sudo systemctl enable docker.service
    sudo systemctl enable containerd.service
    echo -e "Docker configured \xE2\x9C\x94"  
}

install_npm() {
    sudo apt update &> /dev/null
    sudo apt install nodejs -y &> /dev/null
    sudo apt install npm -y &> /dev/null
    echo -e "Npm and Node installed \xE2\x9C\x94"  
}

install_python() {
    sudo apt install python3.11 -y &> /dev/null
    echo -e "Python3.11 installed \xE2\x9C\x94"  
}

install_arduino() {
    curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | sh &> /dev/null
    echo -e "Arduino-cli installed \xE2\x9C\x94"  
}

install_cargo() {
    curl https://sh.rustup.rs -sSf | sh
    echo -e "Cargo installed \xE2\x9C\x94"  
}
install_neofetch() {
    sudo apt install neofetch -y &> /dev/null
    echo -e "Neofetch installed \xE2\x9C\x94"  
}
install_htop() {
    sudo apt install htop -y &> /dev/null
    echo -e "Htop installed \xE2\x9C\x94"  
}
