#!/usr/bin/env bash

# Reenabling snaps
echo 'Reativando snaps'
sudo rm /etc/apt/preferences.d/nosnap.pref

# Additional repositories
echo 'Adicionando repositórios de terceiros'
sudo add-apt-repository -y ppa:daniruiz/flat-remix
sudo apt-add-repository -y ppa:fish-shell/release-3
sudo apt update

# Softwares
echo 'Instalando pacotes do usuário'
apt install -y $(cat packages/user.txt)

# Snaps
echo 'Instalando snaps'
sudo snap install spotify

# Unused softwares
echo 'Removendo pacotes não-utilizados'
apt purge -y $(cat packages/unused.txt)

# Clean packages
echo 'Limpando cache do repositório de pacotes'
apt update
apt upgrade -y
apt clean

# Pastas
echo 'Criando pastas'
mkdir ~/.cache/fish_compare
mkdir ~/.local/bin

# Fish
echo 'Configurando o fish shell'
sudo chsh -s /usr/bin/fish impsid
./initial-settings.fish

# Date and time
echo 'Alterando funcionamento do relógio do sistema'
timedatectl set-local-rtc true

# Input method
echo 'Alterando gerenciador de entradas de teclado'
im-config -n xim

# Java
echo 'Definindo versão do Java a ser utilizada'
sudo update-alternatives --set java /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java

# KVM
echo 'Adicionando usuário ao grupo das máquinas virtuais'
sudo adduser impsid kvm

# DConf settings
echo 'Restaurando configurações via DConf'
dconf load / < settings.ini

