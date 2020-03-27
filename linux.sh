#!/usr/bin/env bash
# Aditional repositories
echo "Adicionando repositórios de terceiros"
sudo add-apt-repository -y ppa:daniruiz/flat-remix
sudo apt update

# Softwares
echo "Instalando pacotes do usuário"
apt install -y $(cat packages/user.txt)

# Optional softwares
# echo "Instalando pacotes opcionais"
# apt install -y $(cat packages/optional.txt)

# Unused softwares
echo "Removendo pacotes não-utilizados"
apt purge -y $(cat packages/unused.txt)

# Clean packages
echo "Limpando cache do repositôrio de pacotes"
apt clean

# Git
echo "Configurando identificação no Git"
git config --global user.name "Moisés Carvalho"
git config --global user.email "moisescarv27@hotmail.com"
git config --global core.excludesfile ~/.gitignore_global

# Git repos
echo "Clonando repositórios"
git clone https://github.com/dracula/vim ~/.vim/pack/plugins/start/dracula

# Fish
echo "Definindo o shell padrão"
sudo chsh -s /usr/bin/fish impsid

# Date and time
echo "Alterando funcionamento do relógio do sistema"
timedatectl set-local-rtc true

# Java
echo "Definindo versão do Java a ser utilizada"
sudo update-alternatives --set java /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java

# KVM
echo "Adicionando usuário ao grupo das máquinas virtuais"
sudo adduser impsid kvm

# SSH
# echo "Gerando chaves públicas e privadas de SSH"
# ssh-keygen -f ~/.ssh/id_rsa -N ""

# DConf settings
echo "Restaurando configurações via DConf"
dconf load / < settings.dconf 
