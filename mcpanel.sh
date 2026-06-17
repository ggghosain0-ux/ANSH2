ANSH MC PANEL INSTALLER

#!/bin/bash

clear

while true; do
    clear
    echo "========================================="
    echo "       ANSH MC PANEL INSTALLER"
    echo "========================================="
    echo ""
    echo "1) SKYPORTD PANEL"
    echo "2) PUFFER PANEL"
    echo "3) DRACO PANEL"
    echo "4) PTERODACTYL PANEL"
    echo "5) PTERODACTYL THEME INSTALLER"
    echo "6) PTERODACTYL PANEL INSTALLER 2"
    echo "7) ASTROWAX PANEL"
    echo "8) ASTROWAX NODE"
    echo "9) OBSIDIAN PANEL"
    echo "10) ANVILCRAFT PANEL"
    echo "0) Exit"
    echo ""
    read -p "Select an option: " option

    case $option in

    1)
        clear
        echo "SKYPORTD PANEL"
        echo "1) Install Panel"
        echo "2) Start Node"
        read -p "Choice: " ch

        case $ch in
        1)
            bash <(curl -s https://raw.githubusercontent.com/ggghosain0-ux/skyport/main/panel.sh)
            ;;
        2)
            bash <(curl -s https://raw.githubusercontent.com/ggghosain0-ux/skyport/main/wings)
            ;;
        esac
        ;;

    2)
        clear
        echo "PUFFER PANEL"
        echo "1) Install PufferPanel"
        echo "2) Create Admin User"
        echo "3) Start Panel"
        read -p "Choice: " ch

        case $ch in
        1)
            bash <(curl -s https://raw.githubusercontent.com/JishnuTheGamer/puffer-panel/refs/heads/main/install)
            ;;
        2)
            sudo pufferpanel user add
            ;;
        3)
            sudo systemctl enable --now pufferpanel
            ;;
        esac
        ;;

    3)
        clear
        echo "DRACO PANEL"
        echo "1) Install Panel"
        echo "2) Install Node"
        echo "3) Start Panel"
        echo "4) Start Node"
        read -p "Choice: " ch

        case $ch in
        1)
            sudo su
            bash <(curl -s https://raw.githubusercontent.com/JishnuTheGamer/Vps/refs/heads/main/jishnu)
            ;;
        2)
            bash <(curl -s https://raw.githubusercontent.com/JishnuTheGamer/Vps/refs/heads/main/node)
            ;;
        3)
            cd panel || exit
            node .
            ;;
        4)
            cd node || exit
            node .
            ;;
        esac
        ;;

    4)
        clear
        echo "PTERODACTYL PANEL"
        echo "1) Install Panel"
        echo "2) Start Wings"
        read -p "Choice: " ch

        case $ch in
        1)
            sudo apt install net-tools -y
            sudo apt install ssh -y
            sudo su
            bash <(curl -s https://pterodactyl-installer.se)
            ;;
        2)
            systemctl start wings
            ;;
        esac
        ;;

    5)
        bash <(curl -s https://raw.githubusercontent.com/JishnuTheGamer/ptero-theme/refs/heads/main/install)
        ;;

    6)
        bash <(curl -s https://raw.githubusercontent.com/ggghosain0-ux/Panel/main/bootstrap.sh)
        ;;

    7)
        rm -rf panel && mkdir panel && cd panel && sudo apt-get update -y && sudo apt-get install -y software-properties-common && sudo add-apt-repository ppa:deadsnakes/ppa -y && sudo apt-get update -y && sudo apt-get install -y build-essential curl git unzip libssl-dev python3.11 python3.11-dev python3.11-distutils python3-pip && /usr/bin/python3.11 -m pip install setuptools && export PYTHON=/usr/bin/python3.11 && export npm_config_python=/usr/bin/python3.11 && export NODE_GYP_FORCE_PYTHON=/usr/bin/python3.11 && nvm install 20 && nvm use 20 && cd ~ && rm -rf AstroWax-Panel && git clone https://github.com/AstroVoidHostDev/AstroWax-Panel && cd AstroWax-Panel && unzip -o panel.zip && cd panel && rm -rf node_modules package-lock.json && npm cache clean --force && npm install --legacy-peer-deps && npm install sqlite3@5.1.6 connect-sqlite3 --build-from-source && npm run seed && npm run createUser && node .
        ;;

    8)
        sudo apt-get update -y && sudo apt-get install -y git zip unzip curl nodejs npm --no-install-recommends && cd ~ && git clone https://github.com/AstroVoidHostDev/WaxDaemon && cd WaxDaemon && unzip -o waxdaemon.zip && cd daemon/daemon && mv -f index.js.txt index.js 2>/dev/null && npm install
        echo ""
        echo "Run the following command to start:"
        echo "node ."
        ;;

    9)
        bash <(curl -fsSL https://raw.githubusercontent.com/ggghosain0-ux/Obsidian-Panel/master/install.sh)
        ;;

    10)
        bash <(curl -s https://raw.githubusercontent.com/ggghosain0-ux/Avilpanelinstaller/main/install.sh)
        ;;

    0)
        echo "Exiting..."
        exit 0
        ;;

    *)
        echo "Invalid option."
        ;;
    esac

    echo ""
    read -p "Press Enter to continue..."
done
