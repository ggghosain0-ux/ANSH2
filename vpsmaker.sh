#!/bin/bash

# VPS MAKER
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
    echo "=================================================="
    echo "                  VPS MAKER"
    echo "            Professional Edition"
    echo "=================================================="
    echo -e "${NC}"
}

pause() {
    echo ""
    read -p "Press Enter to continue..." temp
}

while true; do
    banner

    echo -e "${GREEN}1) CSB VPS${NC}"
    echo -e "${GREEN}2) GIT & IDX VPS${NC}"
    echo -e "${GREEN}3) VM${NC}"
    echo -e "${RED}0) Exit${NC}"
    echo ""

    read -p "Select an option: " option

    case $option in

        1)
            banner
            echo -e "${YELLOW}Installing CSB VPS...${NC}"
            bash <(curl -s https://raw.githubusercontent.com/ggghosain0-ux/Panel/main/CSBVPS)
            echo -e "${GREEN}CSB VPS installation completed.${NC}"
            pause
            ;;

        2)
            banner
            echo -e "${YELLOW}Installing GIT & IDX VPS...${NC}"
            bash <(curl -s https://raw.githubusercontent.com/ggghosain0-ux/Panel/main/IDXvps)
            echo -e "${GREEN}GIT & IDX VPS installation completed.${NC}"
            pause
            ;;

        3)
            banner
            echo -e "${YELLOW}Launching VM Installer...${NC}"
            bash <(curl -s https://raw.githubusercontent.com/hopingboyz/vms/main/vm.sh)
            echo -e "${GREEN}VM setup completed.${NC}"
            pause
            ;;

        0)
            clear
            echo -e "${CYAN}Thank you for using VPS MAKER!${NC}"
            exit 0
            ;;

        *)
            echo -e "${RED}Invalid option! Please try again.${NC}"
            pause
            ;;
    esac
done
