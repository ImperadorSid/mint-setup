#!/usr/bin/env bash
# Softwares
apt install -y $(cat packages/user.txt)

# Optional softwares
# apt install -y $(cat packages/optional.txt)

# Unused softwares
# apt purge -y $(cat packages/unused.txt)

# Clean packages
apt clean

# Git
git config --global user.name "Moisés Carvalho"
git config --global user.email "moisescarv27@hotmail.com"
git config --global core.excludesfile ~/.gitignore_global

# Fish
sudo chsh -s /usr/bin/fish impsid

# Date and time
timedatectl set-local-rtc true

# Java
sudo update-alternatives --set java /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java

# KVM
sudo adduser impsid kvm

# SSH
# ssh-keygen -f ~/.ssh/id_rsa -N ""

# DConf settings
dconf load /org/cinnamon/desktop/keybindings/ < dconf/cinnamon-keybindings.dconf
dconf load /com/gexperts/Tilix/ < dconf/tilix-config.dconf 
