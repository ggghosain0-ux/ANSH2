#!/bin/bash

clear

echo " ______ _   _ _____  ______ _____  __   __"
echo "|  ____| \ | |  __ \|  ____|  __ \ \ \ / /"
echo "| |__  |  \| | |  | | |__  | |__) | \ V / "
echo "|  __| | . \` | |  | |  __| |  _  /   > <  "
echo "| |____| |\  | |__| | |____| | \ \  / . \\ "
echo "|______|_| \_|_____/|______|_|  \_\/_/ \_\\"
echo
echo "        ULTIMATE ENDER INSTALLER"
echo "========================================"
echo
echo "1) MC PANEL"
echo "2) VPS PANEL"
echo "3) VPS MAKER"
echo "4) VPS BOT"
echo "5) DASHBOARD"
echo "0) Exit"
echo

read -p "Select an option: " option

case $option in
1)
    bash <(curl -fsSL https://raw.githubusercontent.com/ggghosain0-ux/ANSH2/main/mcpanel.sh)
    ;;
2)
    bash <(curl -fsSL https://raw.githubusercontent.com/ggghosain0-ux/ANSH2/main/vpspanel.sh)
    ;;
3)
    bash <(curl -fsSL https://raw.githubusercontent.com/ggghosain0-ux/ANSH2/main/vpsmaker.sh)
    ;;
4)
    bash <(curl -fsSL https://raw.githubusercontent.com/ggghosain0-ux/ANSH2/main/vpsbot.sh)
    ;;
5)
    bash <(curl -fsSL https://raw.githubusercontent.com/ggghosain0-ux/ANSH2/main/dash.sh)
    ;;
0)
    echo "Goodbye!"
    exit 0
    ;;
*)
    echo "Invalid option!"
    ;;
esac
