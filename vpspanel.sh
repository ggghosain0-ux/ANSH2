VPS PANEL INSTALLER (Professional Edition)

#!/bin/bash

# VPS PANEL INSTALLER
# Professional Edition

RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
WHITE='\033[1;37m'
NC='\033[0m'

banner() {
    clear
    echo -e "${CYAN}"
    echo "===================================================="
    echo "              VPS PANEL INSTALLER"
    echo "               Professional Edition"
    echo "===================================================="
    echo -e "${NC}"
}

pause() {
    echo ""
    read -p "Press Enter to continue..."
}

while true; do
    banner

    echo -e "${GREEN}1) HVM PANEL V8${NC}"
    echo -e "${GREEN}2) HVM PANEL 5.1${NC}"
    echo -e "${GREEN}3) LXC/LXD INSTALLER${NC}"
    echo -e "${GREEN}4) CLOUDFLARE SETUP${NC}"
    echo -e "${GREEN}5) SKYDO VPS PANEL V1${NC}"
    echo -e "${GREEN}6) HVM PANEL V3${NC}"
    echo -e "${GREEN}7) HVM PANEL V4${NC}"
    echo -e "${RED}0) Exit${NC}"
    echo ""

    read -p "Select an option: " option

    case $option in

    1)
        banner
        echo -e "${YELLOW}Installing HVM PANEL V8...${NC}"

        apt update -y
        apt install git -y

        git clone https://github.com/DreamHost2ws/HVM5.1
        cd HVM5.1 || exit

        apt update
        apt install python3-pip -y

        mkdir -p ~/.config/pip
        echo -e "[global]\nbreak-system-packages = true" > ~/.config/pip/pip.conf

        pip install -r requirements.txt

cat <<EOF > /etc/systemd/system/hvm.service
[Unit]
Description=HVM Panel (Discord Bot)
After=network.target

[Service]
User=root
WorkingDirectory=/root/hvm
ExecStart=/usr/bin/python3 /root/hvm/hvm.py
Restart=always
RestartSec=5
Environment=PYTHONUNBUFFERED=1

[Install]
WantedBy=multi-user.target
EOF

        python3 hvm-5.1.py
        pause
        ;;

    2)
        banner
        echo -e "${YELLOW}Installing HVM PANEL 5.1...${NC}"

        apt update -y
        apt install git -y

        git clone https://github.com/DreamHost2ws/HVM5.1
        cd HVM5.1 || exit

        apt update
        apt install python3-pip -y

        pip install -r requirements.txt

        pip3 install flask flask-socketio flask_login docker paramiko python-dotenv psutil flask-limiter ecdsa

        python3 hvm-5.1.py
        pause
        ;;

    3)
        banner
        echo -e "${YELLOW}Installing LXC/LXD...${NC}"

        bash <(curl -s https://raw.githubusercontent.com/ggghosain0-ux/lxc-installer/main/lxc-installer.sh)

        pause
        ;;

    4)
        banner
        echo -e "${YELLOW}Installing Cloudflare Tunnel...${NC}"

        sudo mkdir -p --mode=0755 /usr/share/keyrings

        curl -fsSL https://pkg.cloudflare.com/cloudflare-public-v2.gpg \
        | sudo tee /usr/share/keyrings/cloudflare-public-v2.gpg >/dev/null

        echo 'deb [signed-by=/usr/share/keyrings/cloudflare-public-v2.gpg] https://pkg.cloudflare.com/cloudflared any main' \
        | sudo tee /etc/apt/sources.list.d/cloudflared.list

        sudo apt-get update
        sudo apt-get install cloudflared -y

        read -p "Enter your Cloudflare Tunnel Token: " token

        cloudflared service install $token

        pause
        ;;

    5)
        banner
        echo -e "${YELLOW}Installing SKYDO VPS PANEL V1...${NC}"

        git clone https://github.com/ggghosain0-ux/SKYDOPANELINSTALLERV3

        cd SKYDOPANELINSTALLERV3 || exit

        chmod +x install.sh
        ./install.sh

        pause
        ;;

    6)
        banner
        echo -e "${YELLOW}Installing HVM PANEL V3...${NC}"

        bash <(curl -s https://raw.githubusercontent.com/ggghosain0-ux/Vpanel3./main/install.sh)

        pause
        ;;

    7)
        banner
        echo -e "${YELLOW}Installing HVM PANEL V4...${NC}"

        sudo apt update

        sudo apt install git -y

        git clone https://github.com/ggghosain0-ux/Vpanel3.1.git

        sudo apt install python3-pip -y

        cd Vpanel3.1 || exit

        pip3 install flask flask-socketio flask_login docker paramiko python-dotenv psutil flask-limiter ecdsa

        docker ps -a

        docker network create vps-net

        echo ""
        echo "Run your KVM container manually:"
        echo "docker run --net vps-net --privileged --device /dev/kvm -it <image_name>"
        echo ""

        python3 hvm.py

        pause
        ;;

    0)
        echo -e "${RED}Thank you for using VPS PANEL INSTALLER.${NC}"
        exit 0
        ;;

    *)
        echo -e "${RED}Invalid option.${NC}"
        pause
        ;;
    esac
done
