#!/bin/bash

# ==========================================
#           ANSH INSTALLER
#            made  by skydo
# ==========================================

RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
NC='\033[0m'

banner() {
    clear
    echo -e "${CYAN}"
    echo "===================================================="
    echo "                 ANSH INSTALLER"
    echo "===================================================="
    echo "               Professional Edition"
    echo "===================================================="
    echo -e "${NC}"
}

pause() {
    echo ""
    read -p "Press Enter to continue..." temp
}

while true; do
    banner

    echo -e "${GREEN}1) MC PANEL${NC}"
    echo -e "${GREEN}2) VPS PANEL${NC}"
    echo -e "${GREEN}3) 24/7 CODE${NC}"
    echo -e "${GREEN}4) VPS MAKER${NC}"
    echo -e "${GREEN}5) VPS BOT${NC}"
    echo -e "${RED}0) Exit${NC}"
    echo ""

    read -p "Select an option: " option

    case $option in

        1)
            clear
            echo -e "${YELLOW}Launching MC PANEL Installer...${NC}"
            bash <(curl -s https://raw.githubusercontent.com/ggghosain0-ux/ANSH2/main/mcpanel.sh)
            pause
            ;;

        2)
            clear
            echo -e "${YELLOW}Launching VPS PANEL Installer...${NC}"
            bash <(curl -s https://raw.githubusercontent.com/ggghosain0-ux/ANSH2/main/vpspanel.sh)
            pause
            ;;

        3)
            clear
            echo -e "${YELLOW}Launching 24/7 CODE...${NC}"
            bash <(curl -s https://raw.githubusercontent.com/ggghosain0-ux/ANSH2/main/24code.sh)
            pause
            ;;

        4)
            clear
            echo -e "${YELLOW}Launching VPS MAKER...${NC}"
            bash <(curl -s https://raw.githubusercontent.com/ggghosain0-ux/ANSH2/main/vpsmaker.sh)
            pause
            ;;

        5)
            clear
            echo -e "${YELLOW}Launching VPS BOT Installer...${NC}"
            bash <(curl -s https://raw.githubusercontent.com/ggghosain0-ux/ANSH2/main/vpsbot.sh)
            pause
            ;;

        0)
            clear
            echo -e "${CYAN}Thank you for using ANSH INSTALLER!${NC}"
            exit 0
            ;;

        *)
            echo -e "${RED}Invalid option! Please try again.${NC}"
            pause
            ;;
    esac
done
