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
COLOR3='\33[0;33m'
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
    printf "${YELLOW} LAST NEW Artifacts : Souhaitez-vous instalaltion du serveur Five M avec la version de 4162 ❓  [o/N]\\n"
    read reponse
if [[ "$reponse" == "o" ]]
then 
printf "${CYAN} Démarrage de l'instalaltion de version de 4162 pour serveur Five M !"
    cd /home/
    mkdir fivem
    cd /home/fivem
    wget  https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/4162-b20486b86a968b9e0d36b10cc7c88d83de579e79/fx.tar.xz 
    tar xvfJ fx.tar.xz
    rm fx.tar.xz
fi
sleep 2

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
    sudo apt-get install php-mbstring php-gettext
    sudo apt -y install php7.4
    apt install -y php7.4-{cli,gd,mysql,pdo,mbstring,tokenizer,bcmath,xml,fpm,curl,zip} mariadb-client mariadb-server apache2 tar unzip git 
    php -v

fi
sleep 2

echo -n -e "${GREEN}Quel est le nom de votre base de données ❓ ${YELLOW}(sh_base)${reset}: "
read -r DBNAME

if [[ "$DBNAME" == "" ]]; then
  DBNAME="sh_base"  
fi

echo -n -e "${GREEN}Quel est l'utilisateur de votre base de données ❓ ${YELLOW}(sh-fivem)${reset}: "
read -r DBUSER

if [[ "$DBUSER" == "" ]]; then
  DBUSER="sh-fivem"  
fi

echo -n -e "${GREEN}Quel est le mot de passe de votre base de données ❓ ${reset}: "
read -s -r DBPASS

while true; do

  if [[ "$DBPASS" == "" ]]; then
    echo -e "${red}Le mot de passe doit être obligatoire !"
    echo -n -e "${GREEN}Quel est le mot de passe de votre base de données ❓ ${reset}: "
    read -s -r DBPASS
  else
    echo -e "${GREEN}Le mot de passe est correct !${reset}" 
    break 
  fi
done 


#Installation PHPMYADMIN
echo
    printf "${YELLOW} Souhaitez-vous crée une installation automatique de PHPMYADMIN   ❓ [o/N]\\n"
    read reponse
if [[ "$reponse" == "o" ]]
then 
printf "${CYAN} Démarrage de l'instalaltion de phpMyAdmin pour serveur Five M !"
    apt install phpmyadmin
    sudo service apache2 restart
    ln -s /usr/share/phpmyadmin/ /var/www/html/phpmyadmin
    echo "Lien du phpMyAdmin : http://$(hostname -I)/phpmyadmin/"
fi

echo -e "Configuration de la utilisateur"
  echo "Mettre le mot de passe root de MySQL"
  sleep 2
  mysql -e "CREATE USER '${DBUSER}'@'localhost' IDENTIFIED BY '${DBPASS}';"
  mysql -e "CREATE DATABASE ${DBNAME};"
  mysql -p -e "GRANT ALL PRIVILEGES ON * . * TO '${DBUSER}'@'localhost';"
  mysql -e "FLUSH PRIVILEGES;"
  

  sleep 3
    printf "${COLOR3} L'installation est terminée ! \\n"
    printf "${COLOR3} Discord de SH-FIVEM : https://discord.gg/Bx5UUV54mu \\n"
    printf "${COLOR3} Github de Clahsplayer sur SH-FIVEM: https://github.com/Clashplayer-PROTECT/sh-fivem \\n"
    sleep 3
    printf "${COLOR1} TOPO du MYSQL: ${DBNAM} \\n"
    printf "${COLOR1} Nom de la base de données MySQL: ${DBNAM} \\n"
    printf "${COLOR1} Nom d'hôte de la base de données MySQL: ${DBHOST} \\n"
    printf "${COLOR1} Nom d'utilisateur de la base de données MySQL: ${DBUSER}: ${DBNAM} \\n"
    sleep 3
    printf "${COLOR2}💻 TOPO sur créaction de votre seveur ! \\n"
    printf "${COLOR2}💻 Chemin du dossier  : /home/fivem \\n"
    printf "${COLOR2}💻 Ne surtout pas supprime run.sh et alpine\\n"
    printf "${NC}\\n"    


cat << "EOF"
   _____ __  __      ___________    __________  ___
  / ___// / / /     / ____/  _/ |  / / ____/  |/  /
  \__ \/ /_/ /_____/ /_   / / | | / / __/ / /|_/ / 
 ___/ / __  /_____/ __/ _/ /  | |/ / /___/ /  / /  
/____/_/ /_/     /_/   /___/  |___/_____/_/  /_/   
                                                   
EOF
