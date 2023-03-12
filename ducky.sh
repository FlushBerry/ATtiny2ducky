#!/bin/bash

echo "Downloading Ardino & installation"
mkdir Arduino
cd Arduino

wget 'https://downloads.arduino.cc/arduino-1.8.18-linux64.tar.xz'
wget 'https://raw.githubusercontent.com/mame82/duck2spark/master/duck2spark.py'
tar -xJf arduino-1.8.18-linux64.tar.xz
sudo  mv arduino-1.8.18 /usr/share
cd /usr/share/arduino-1.8.18
sudo ./install.sh


#adding rules
sudo touch /etc/udev/rules.d/digispark.rules
sudo echo 'SUBSYSTEM=="usb", ATTR{idVendor}=="16d0", ATTR{idProduct}=="0753", MODE="0660", GROUP="dialout"'> /etc/udev/rules.d/digispark.rules

sudo echo 'SUBSYSTEMS=="usb", ATTRS{idVendor}=="16d0", ATTRS{idProduct}=="0753", MODE:="0666", GROUP="dialout"'>/etc/udev/rules.d/49-micronucleus.rules
sudo echo 'SUBSYSTEMS=="usb", ATTRS{idVendor}=="16d0", ATTRS{idProduct}=="0753", MODE:="0666", GROUP="dialout"'>/lib/udev/rules.d/49-micronucleus.rules

sudo echo 'KERNEL=="ttyACM*", ATTRS{idVendor}=="16d0", ATTRS{idProduct}=="0753", MODE:="0666", ENV{ID_MM_DEVICE_IGNORE}="1"'>>/etc/udev/rules.d/49-micronucleus.rules
sudo echo 'KERNEL=="ttyACM*", ATTRS{idVendor}=="16d0", ATTRS{idProduct}=="0753", MODE:="0666", ENV{ID_MM_DEVICE_IGNORE}="1"'>>/lib/udev/rules.d/49-micronucleus.rules

sudo echo 'SUBSYSTEMS=="usb", ATTRS{idVendor}=="16d0", ATTRS{idProduct}=="0753", MODE:="0666"'>/etc/udev/rules.d/90-digispark.rules
sudo echo 'SUBSYSTEMS=="usb", ATTRS{idVendor}=="16d0", ATTRS{idProduct}=="0753", MODE:="0666"'>/lib/udev/rules.d/90-digispark.rules

sudo echo 'KERNEL=="ttyACM*", ATTRS{idVendor}=="16d0", ATTRS{idProduct}=="0753", MODE:="0666", ENV{ID_MM_DEVICE_IGNORE}="1"'>>/etc/udev/rules.d/90-digispark.rules
sudo echo 'KERNEL=="ttyACM*", ATTRS{idVendor}=="16d0", ATTRS{idProduct}=="0753", MODE:="0666", ENV{ID_MM_DEVICE_IGNORE}="1"'>>/lib/udev/rules.d/90-digispark.rules

echo "DONE"

clear
echo ""
echo "   ___  _   _  ___ _  ____   __"
echo " |   \| | | |/ __| |/ /\ \ / /"
echo " | |) | |_| | (__| ' <  \ V / "
echo " |___/ \___/ \___|_|\_\  |_|  "
echo ""
echo "### -STEPS- ###"
echo ""
echo "1- Visit, Create & Encode  @ https://ducktoolkit.com/encode"
echo "#Don't forget to select your languague"
echo ""
echo "2- Digispark compiler with :"
echo "  python2 duck2spark.py -i inject.bin -l 1 -f 1000 payload.bin"
echo "-i : input file"
echo "-o : output file"
echo "-l : loop count"
echo "-f : delay before script start"
echo ""
echo "3- Ardino cfg"
echo "[Preferences] > [URL] http://digistump.com/package_digistump_index.json"
echo "[Tools] > [BoardType] > [Gestionnary] Contribué : install Digistump AVR Boards"
echo "[Tools] > [BoardType] Select you DigiBoard  ex: Digispark(16mhz - No USB)"
echo "PASTE the script"
echo ""
echo "4- Launch"
echo "Button : [Verify] then [Upload]"
echo "Plug USB_ATTiny"
echo ""
echo "ENJOY"
