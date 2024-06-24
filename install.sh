#!/bin/bash

set +e

mkdir -p ~/.ssh
touch ~/.ssh/authorized_keys

curl https://github.com/plawall-qvest.keys | tee -a ~/.ssh/authorized_keys

echo "alias ll='ls -l'" >> ~/.bashrc
echo "alias la='ls -A'" >> ~/.bashrc
echo "alias l='ls -CF'" >> ~/.bashrc

sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y
sudo apt install cockpit -y

wget https://github.com/45Drives/cockpit-navigator/releases/download/v0.5.10/cockpit-navigator_0.5.10-1focal_all.deb -O ~/cockpit-navigator_0.5.10-1focal_all.deb
sudo apt install ~/cockpit-navigator_0.5.10-1focal_all.deb -y

# Download Companion Modules

wget https://raw.githubusercontent.com/plawall-qvest/companion-modules/main/companion-module-ctouch-riva2.zip -O ~/companion-module-ctouch-riva2.zip
wget https://raw.githubusercontent.com/plawall-qvest/companion-modules/main/companion-module-syscomtec-switcher.zip -O ~/companion-module-syscomtec-switcher.zip

unzip -o companion-module-ctouch-riva2.zip -d companion-module-ctouch-riva2
unzip -o companion-module-syscomtec-switcher.zip -d companion-module-syscomtec-switcher

# Copy Modules to /opt/companion-module-dev
sudo cp -r companion-module-* /opt/companion-module-dev/

sudo reboot
