#!/usr/bin/env bash
# Aditional repositories
echo 'Adicionando repositórios de terceiros'
sudo add-apt-repository -y ppa:daniruiz/flat-remix
sudo apt-add-repository -y ppa:fish-shell/release-3
sudo apt-add-repository -y ppa:uget-team/ppa
sudo apt update

# Softwares
echo 'Instalando pacotes do usuário'
apt install -y $(cat packages/user.txt)

# Optional softwares
# echo 'Instalando pacotes opcionais'
# apt install -y $(cat packages/optional.txt)

# Unused softwares
echo 'Removendo pacotes não-utilizados'
apt purge -y $(cat packages/unused.txt)

# Clean packages
echo 'Limpando cache do repositório de pacotes'
apt clean
apt autoremove -y

# Pastas
echo 'Criando pastas'
mkdir ~/.cache/fish_json
mkdir ~/.local/bin
mkdir ~/.local/scripts

# Git
echo 'Configurando identificação no Git'
git config --global user.name "Moisés Carvalho"
git config --global user.email "moisescarv27@hotmail.com"
git config --global core.excludesfile ~/.gitignore_global

# Git repos
echo 'Instalando extensões do Vim'
git clone https://github.com/dracula/vim ~/.vim/pack/themes/opt/dracula
git clone https://github.com/dag/vim-fish ~/.vim/pack/syntax/start/fish
git clone https://github.com/dart-lang/dart-vim-plugin ~/.vim/pack/syntax/start/dart
git clone https://github.com/jiangmiao/auto-pairs ~/.vim/pack/plugins/start/auto-pairs

# Fish
echo 'Configurando o fish shell'
sudo chsh -s /usr/bin/fish impsid
./initial-config.fish

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
dconf reset -f /org/gnome/terminal/legacy/
dconf load / < settings.dconf 
