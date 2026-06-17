#!/bin/bash

RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
NC='\033[0m'

banner() {
    clear
    echo -e "${CYAN}"
    echo "===================================================="
    echo "                 VPS BOT INSTALLER"
    echo "              Professional Edition"
    echo "===================================================="
    echo -e "${NC}"
}

pause() {
    echo ""
    read -p "Press Enter to continue..." temp
}

OS=$(. /etc/os-release && echo "$ID")

while true; do
    banner

    echo -e "${GREEN}1) LXC BOT V6${NC}"
    echo -e "${GREEN}2) UNIX BOT${NC}"
    echo -e "${GREEN}3) T BOT${NC}"
    echo -e "${RED}0) Exit${NC}"
    echo ""

    read -p "Select an option: " option

    case $option in

    1)
        banner
        echo -e "${YELLOW}Installing LXC BOT V6...${NC}"

        apt update
        apt install git -y

        git clone https://github.com/DreamHost2ws/VPSbotv6
        cd VPSbotv6 || exit

        if [[ "$OS" == "ubuntu" ]]; then
            sudo apt update && sudo apt upgrade -y
            sudo apt install lxc lxc-utils -y

            sudo apt install snapd -y
            sudo systemctl enable --now snapd.socket

            sudo snap install lxd

            sudo usermod -aG lxd $USER
            newgrp lxd

            sudo lxd init

            sudo apt update
            sudo apt install lxc lxc-utils bridge-utils uidmap -y
        fi

        if [[ "$OS" == "debian" ]]; then
            sudo apt install snapd -y
            sudo systemctl enable --now snapd.socket

            sudo ln -s /var/lib/snapd/snap /snap

            sudo snap install lxd

            sudo usermod -aG lxd $USER
            newgrp lxd

            sudo lxd init
        fi

        apt install python3-pip -y

        mkdir -p ~/.config/pip
        echo -e "[global]\nbreak-system-packages = true" > ~/.config/pip/pip.conf

        read -p "Enter DISCORD BOT TOKEN: " TOKEN
        read -p "Enter MAIN ADMIN ID: " ADMIN

cat <<EOF > /etc/systemd/system/unixbot.service
[Unit]
Description=UnixBot Discord Bot
After=network.target

[Service]
User=root
WorkingDirectory=/root/VPSbotv6
Environment="PYTHONUNBUFFERED=1"
Environment="DISCORD_TOKEN=$TOKEN"
Environment="MAIN_ADMIN_ID=$ADMIN"
ExecStart=/usr/bin/python3 /root/VPSbotv6/bot.py
Restart=always
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF

        systemctl daemon-reload
        systemctl enable unixbot
        systemctl restart unixbot

        echo -e "${GREEN}LXC BOT V6 Installed & Running.${NC}"

        pause
        ;;

    2)
        banner
        echo -e "${YELLOW}Installing UNIX BOT...${NC}"

        git clone https://github.com/hopingboyz/vps-deploy

        cd vps-deploy || exit

        cp test.env .env

        apt install python3-pip -y

        mkdir -p ~/.config/pip
        echo -e "[global]\nbreak-system-packages = true" > ~/.config/pip/pip.conf

        pip install -r requirements.txt

        cat <<EOF > /etc/systemd/system/unixbot.service
[Unit]
Description=UnixBot Discord Bot
After=network.target

[Service]
User=root
WorkingDirectory=/root/vps-deploy
ExecStart=/usr/bin/python3 /root/vps-deploy/bot.py
Restart=always
RestartSec=5
Environment=PYTHONUNBUFFERED=1

[Install]
WantedBy=multi-user.target
EOF

        sudo systemctl daemon-reload
        sudo systemctl enable unixbot
        sudo systemctl restart unixbot

        echo -e "${GREEN}UNIX BOT Installed & Running.${NC}"

        pause
        ;;

    3)
        banner
        echo -e "${YELLOW}Installing T BOT...${NC}"

        bash <(curl -s https://raw.githubusercontent.com/TS-25/VPS-MAKER-BOT/main/install.sh)

        pause
        ;;

    0)
        clear
        echo -e "${CYAN}Thank you for using VPS BOT INSTALLER!${NC}"
        exit 0
        ;;

    *)
        echo -e "${RED}Invalid option!${NC}"
        pause
        ;;
    esac
done
