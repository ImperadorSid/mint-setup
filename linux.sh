#!/usr/bin/env bash
# Aditional repositories
echo "Adicionando repositórios de terceiros"
sudo add-apt-repository -y ppa:daniruiz/flat-remix
sudo add-apt-repository -y ppa:uget-team/ppa
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
echo "Limpando cache do repositório de pacotes"
apt clean
apt autoremove -y

# Git
echo "Configurando identificação no Git"
git config --global user.name "Moisés Carvalho"
git config --global user.email "moisescarv27@hotmail.com"
git config --global core.excludesfile ~/.gitignore_global

# Git repos
echo "Instalando extensões do Vim"
git clone https://github.com/dracula/vim ~/.vim/pack/themes/opt/dracula
git clone https://github.com/dag/vim-fish ~/.vim/pack/syntax/start/fish
git clone https://github.com/dart-lang/dart-vim-plugin ~/.vim/pack/syntax/start/dart

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
dconf reset -f /org/gnome/terminal/legacy/
dconf load / < settings.dconf 
