#!/bin/bash

INSTLOG="install.log"

#clear the screen
clear

# set some expectations for the user

echo "  ____                ____  _____          ";
echo " / ___|__ _ _ __  ___|___ \| ____|___  ___ ";
echo "| |   / _' | '_ \/ __| __) |  _| / __|/ __|";
echo "| |__| (_| | |_) \__ \/ __/| |___\__ \ (__ ";
echo " \____\__,_| .__/|___/_____|_____|___/\___|";
echo "           |_|                             ";

echo "                                            "
echo "                                            "
read -n1 -rep $' Would you like to continue with the install (y,n) ' INST
if [[ $INST == "Y" || $INST == "y" ]]; then
    echo -e "$COK - Starting install script.."
else
    echo -e "$CNT - This script would now exit, no changes were made to your system."
    exit
fi

#### Check for yay ####
ISYAY=/sbin/yay
if [ -f "$ISYAY" ]; then
    echo -e "$COK - yay was located, moving on."
else
    echo -e "$CWR - Yay was NOT located"
    read -n1 -rep $'[\e[1;33mACTION\e[0m] - Would you like to install yay (y,n) ' INSTYAY
    if [[ $INSTYAY == "Y" || $INSTYAY == "y" ]]; then
        git clone https://aur.archlinux.org/yay.git &>> $INSTLOG
        cd yay
        makepkg -si --noconfirm &>> ../$INSTLOG
        cd ..

    else
        echo -e "$CER - Yay is required for this script, now exiting"
        exit
    fi
fi

### These are personal applications I use, feel free to remove or change ###
PACKAGES="interception-caps2esc"

echo -e "\n$CNT - Installing packages..."
yay -S $PACKAGES --noconfirm --needed --overwrite &>> $INSTLOG


# Prompt user for confirmation
read -n1 -r -p $'Would you like to copy file to /etc/ folder (y,n) ' INST
echo    # Move to a new line

# Check user input
if [[ $INST == "y" || $INST == "Y" ]]; then
    # Echo and create a directory
    echo "sudo mkdir -p /etc/interception/"
    sudo mkdir -p /etc/interception/

    # Echo and copy the file
    echo "sudo cp ./undevmon.yaml /etc/interception/udevmon.yaml"
    sudo cp ./udevmon.yaml /etc/interception/udevmon.yaml

    # Echo and enable udevmon service
    echo "sudo systemctl enable udevmon"
    sudo systemctl enable udevmon

    # Echo and start udevmon service
    echo "sudo systemctl start udevmon"
    sudo systemctl start udevmon

    # Print confirmation message
    echo "Everything Allright"
else
    echo "Installation aborted."
fi


clear

echo "  ____                _               _           ____             _        ";
echo " / ___|__ _ _ __  ___| |    ___   ___| | __      / ___| _   _  ___| | _____ ";
echo "| |   / _' | '_ \/ __| |   / _ \ / __| |/ /      \___ \| | | |/ __| |/ / __|";
echo "| |__| (_| | |_) \__ \ |__| (_) | (__|   <        ___) | |_| | (__|   <\\__ \\";
echo " \____\__,_| .__/|___/_____\___/ \___|_|\_\      |____/ \__,_|\___|_|\_\___/";
echo "           |_|                                                              ";
