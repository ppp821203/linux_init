#!/bin/bash
echo "============== [S] Install - apt =============="

sudo apt-get install -y $(cat pkglist_apt)
sudo apt-get update && sudo apt-get -y upgrade

echo "============== [E] Install - apt =============="

echo "============== [S] Install - flatpak =============="

sudo rm -rf /var/lib/flatpak
sudo mkdir -p ~/.var/lib/flatpak
sudo ln -s ~/.var/lib/flatpak /var/lib/flatpak

sudo apt-get install -y flatpak
sudo apt-get install -y gnome-software-plugin-flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

sudo flatpak install -y $(cat pkglist_flatpak)
sudo chown -R lwh:lwh ~/.var

echo "============== [E] Install - flatpak =============="

echo "============== [S] Config - Git =============="
git config --global user.name "ppp821203"
git config --global user.email ppp821203@gmail.com
echo "============== [E] Config - Git =============="
