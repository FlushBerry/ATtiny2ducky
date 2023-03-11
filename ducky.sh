#!/bin/bash

echo "Downloading Ardino & installation"
mkdir Ardino
cd Ardino

wget 'https://downloads.arduino.cc/arduino-1.8.18-linux64.tar.xz'
wget 'https://raw.githubusercontent.com/mame82/duck2spark/master/duck2spark.py'
tar -xJf arduino-1.8.18-linux64.tar.xz
sudo  mv arduino-1.8.18 /usr/share
cd /usr/share/arduino-1.8.18
sudo ./install.sh
touch /etc/udev/rules.d/digispark.rules
echo 'SUBSYSTEM=="usb", ATTR{idVendor}=="16d0", ATTR{idProduct}=="0753", MODE="0660", GROUP="dialout"'> /etc/udev/rules.d/digispark.rules

echo "DONE"
clear
echo ""
echo "   ___  _   _  ___ _  ____   __"
echo " |   \| | | |/ __| |/ /\ \ / /"
echo " | |) | |_| | (__| ' <  \ V / "
echo " |___/ \___/ \___|_|\_\  |_|  "
echo ""
echo "### -STEPS- ###"
echo "1- Visit & Encode  https://ducktoolkit.com/encode#"
echo ""
echo "2- Digispark compiler with :"
echo "  python2 duck2spark.py -i Downloads/inject.bin -l 1 -f 1000 payload.bin"
echo "-i : input file"
echo "-o : output file"
echo "-l : loop count"
echo "-f : delay before script start"
echo ""
echo "3- Ardino cfg"
echo "[Preferences] > [URL] http://digistump.com/package_digistump_index.json"
echo "[Tools] > [BoardType] > [Gestionnary] Contribué : install Digistump AVR Boards"
echo "[Tools] > [Libraries] > install DigiKeyboardFr"
echo "PASTE the script"
echo ""
echo "4- Launch"
echo "[Tools] > [Upload]"
echo "Plug USB_ATTiny"
echo ""
echo "ENJOY"
