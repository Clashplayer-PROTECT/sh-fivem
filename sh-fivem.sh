#!/bin/bash
# Script Auto Install Five M
#=====================================================================================
# Author:   Clashplayer#8772 
#=====================================================================================
#=====================================================================================
# Root Force
# By Clashplayer#8772

cat << "EOF"
   _____ __  __      ___________    __________  ___
  / ___// / / /     / ____/  _/ |  / / ____/  |/  /
  \__ \/ /_/ /_____/ /_   / / | | / / __/ / /|_/ / 
 ___/ / __  /_____/ __/ _/ /  | |/ / /___/ /  / /  
/____/_/ /_/     /_/   /___/  |___/_____/_/  /_/   
                                                                                 
EOF
#Supported systems:
supported="Ubuntu"
COLOR1='\033[0;32m'                                         #green color
COLOR2='\033[0;31m'                                         #red color
NC='\033[0m'                                                #no color

 if [ "$(id -u)" != "0" ]; then
         printf "${RED}ERREUR : SH-FIVEM  n'a pas accès root. ⛔️\\n" 1>&2
         printf "\\n"
         exit 1
 fi
    printf "${COLOR1}©️  Copyright Tous droits réservés.©️ \\n"
    printf "${COLOR2}💻 Systèmes pris en charge : $supported 💻\\n"
    printf "${NC}\\n"    
    sleep 6
#############################################################################

# Prérequis installation Five M
apt update
apt upgrade
apt install sudo
apt install xz-utils
apt install git
apt install curl
apt install screen
apt update
apt upgrade

#Installation de 3123
echo
    printf "${YELLOW} UPDATE Artifacts : Souhaitez-vous instalaltion du serveur Five M avec la version de 3524 ❓  [o/N]\\n"
    read reponse
if [[ "$reponse" == "o" ]]
then 
printf "${CYAN} Démarrage de l'instalaltion de version de 3524 pour serveur Five M !"
    cd /home/
    mkdir fivem
    cd /home/fivem
    wget  https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/3539-86d8fe5891dbdc38d43976e6a8afec97215530e8/fx.tar.xz 
    tar xvfJ fx.tar.xz
    rm fx.tar.xz
fi
sleep 2



-
# Installation MARIADB
echo
    printf "${YELLOW} Souhaitez-vous crée une installation automatique de MARIADB   ❓ [o/N]\\n"
    read reponse
if [[ "$reponse" == "o" ]]
then 
printf "${CYAN} Démarrage de l'instalaltion de MARIADB pour serveur Five M !"
    apt -y install software-properties-common curl apt-transport-https ca-certificates gnupg
    LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php
    add-apt-repository -y ppa:chris-lea/redis-server
    curl -sS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | sudo bash
    apt update
    sudo add-apt-repository ppa:ondrej/php
    sudo apt-get update
    sudo apt -y install php7.4
    apt install -y php7.4-{cli,gd,mysql,pdo,mbstring,tokenizer,bcmath,xml,fpm,curl,zip} mariadb-client mariadb-server apache2 tar unzip git 
    php -v

fi
sleep 2



#Installation PHPMYADMIN
echo
    printf "${YELLOW} Souhaitez-vous crée une installation automatique de PHPMYADMIN   ❓ [o/N]\\n"
    read reponse
if [[ "$reponse" == "o" ]]
then 
printf "${CYAN} Démarrage de l'instalaltion de phpMyAdmin pour serveur Five M !"
    apt install phpmyadmin

    echo "Lien du phpMyAdmin : http://$(hostname -I)/phpmyadmin/"
fi


cat << "EOF"
   _____ __  __      ___________    __________  ___
  / ___// / / /     / ____/  _/ |  / / ____/  |/  /
  \__ \/ /_/ /_____/ /_   / / | | / / __/ / /|_/ / 
 ___/ / __  /_____/ __/ _/ /  | |/ / /___/ /  / /  
/____/_/ /_/     /_/   /___/  |___/_____/_/  /_/   
                                                   
EOF
