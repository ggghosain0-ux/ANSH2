#!/bin/bash

clear
echo "=================================="
echo "      DASHBOARD INSTALL"
echo "=================================="
echo "1. VOIDORA CLOUD Dashboard"
echo "2. SKYPORTD PANEL Dashboard"
echo
read -p "Select an option (1-2): " option

case $option in
    1)
        echo "Installing VOIDORA CLOUD Dashboard..."
        git clone https://github.com/ggghosain0-ux/Dash156.git
        cd Dash156 || exit
        bash install.sh
        ;;
    2)
        echo "Installing SKYPORTD PANEL Dashboard..."
        git clone https://github.com/ggghosain0-ux/Ender.git
        cd Ender || exit
        mkdir -p dash2
        unzip dashv2.zip -d dash2
        cd dash2 || exit
        bash install-local.sh
        ;;
    *)
        echo "Invalid option."
        exit 1
        ;;
esac
