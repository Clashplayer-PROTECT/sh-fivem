#!/bin/bash
# Script Auto Install Five M
#=====================================================================================
# Author:   Clashplayer#3630 
#=====================================================================================
#=====================================================================================
# Root Force
# By Clashplayer#8772

cat << "EOF"
  /$$$$$$  /$$   /$$         /$$$$$$$$ /$$$$$$ /$$    /$$ /$$$$$$$$ /$$      /$$       /$$    /$$  /$$$$$$        /$$  
 /$$__  $$| $$  | $$        | $$_____/|_  $$_/| $$   | $$| $$_____/| $$$    /$$$      | $$   | $$ /$$__  $$     /$$$$  
| $$  \__/| $$  | $$        | $$        | $$  | $$   | $$| $$      | $$$$  /$$$$      | $$   | $$|__/  \ $$    |_  $$  
|  $$$$$$ | $$$$$$$$ /$$$$$$| $$$$$     | $$  |  $$ / $$/| $$$$$   | $$ $$/$$ $$      |  $$ / $$/  /$$$$$$/      | $$  
 \____  $$| $$__  $$|______/| $$__/     | $$   \  $$ $$/ | $$__/   | $$  $$$| $$       \  $$ $$/  /$$____/       | $$  
 /$$  \ $$| $$  | $$        | $$        | $$    \  $$$/  | $$      | $$\  $ | $$        \  $$$/  | $$            | $$  
|  $$$$$$/| $$  | $$        | $$       /$$$$$$   \  $/   | $$$$$$$$| $$ \/  | $$         \  $/   | $$$$$$$$ /$$ /$$$$$$
 \______/ |__/  |__/        |__/      |______/    \_/    |________/|__/     |__/          \_/    |________/|__/|______/                             
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
     printf "${COLOR1} Plus besoin du screen avec la version 2.1 de  \\n"
    printf "${COLOR1}©️  Copyright Tous droits réservés.©️ \\n"
    printf "${COLOR2}💻 Systèmes pris en charge : $supported 💻\\n"
    printf "${NC}\\n"    
    sleep 6
#############################################################################

# Prérequis installation Five M
apt update -y
apt upgrade -y
apt install sudo xz-utils git curl screen -y

#Installation de 5104
echo
    printf "${YELLOW} LAST NEW Artifacts : Souhaitez-vous instalaltion du serveur Five M avec la version de 5104 ❓  [o/N]\\n"
    read reponse
if [[ "$reponse" == "o" ]]
then 
printf "${CYAN} Démarrage de l'instalaltion de version de 5104 pour serveur Five M !"
    cd /home/
    mkdir -p fivem
    cd /home/fivem
    wget  https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/5848-4f71128ee48b07026d6d7229a60ebc5f40f2b9db/fx.tar.xz
    tar xvfJ fx.tar.xz
    # Suppression du cache automatique
    # sed -i '1irm -r cache' run.sh
    rm fx.tar.xz
fi
sleep 2

#Installation de SYSTEMCTL
echo
    printf "${YELLOW} Vous souhaitez disposer d'une nouvelle technologie pour démarrer votre serveur fivem ?  ❓  [o/N]\\n"
    read reponse
if [[ "$reponse" == "o" ]]
then 
printf "${CYAN} Démarrage technologie pour démarrer votre serveur fivem !"
    cd /etc/systemd/system
    wget https://raw.githubusercontent.com/Clashplayer-PROTECT/sh-fivem/master/fivem.service
    systemctl enable fivem.service
fi
sleep 2

#Installation de SYSTEMCTL | TXADMIN
echo
    printf "${YELLOW} Vous souhaitez disposer d'une nouvelle technologie pour démarrer votre serveur TXADMIN ?  ❓  [o/N]\\n"
    read reponse
if [[ "$reponse" == "o" ]]
then 
printf "${CYAN} Démarrage technologie pour démarrer votre serveur TXADMIN !"
    cd /etc/systemd/system
    wget https://raw.githubusercontent.com/Clashplayer-PROTECT/sh-fivem/master/txadmin.service
    systemctl enable txadmin.service
fi
sleep 2

# Installation MARIADB
echo
    printf "${YELLOW} Souhaitez-vous créer une installation automatique de MariaDB   ❓ [o/N]\\n"
    read reponse
if [[ "$reponse" == "o" ]]
then 
printf "${CYAN} Démarrage de l'instalaltion de MariaDB pour serveur FiveM !"
    apt -y install software-properties-common curl apt-transport-https ca-certificates gnupg
    LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php
    add-apt-repository -y ppa:chris-lea/redis-server
    curl -sS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | sudo bash
    apt update -y
    sudo add-apt-repository ppa:ondrej/php
    sudo apt-get update -y
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

sleep 2
echo -n -e "${GREEN}Quel est l'utilisateur de votre base de données ❓ ${YELLOW}(sh-fivem)${reset}: "
read -r DBUSER

if [[ "$DBUSER" == "" ]]; then
  DBUSER="sh-fivem"  
fi

sleep 2
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
    echo -en '\n'
    sleep 3
    printf "${COLOR1} TOPO du MySQL \\n"
    printf "${COLOR1} Lien du phpMyAdmin : http://$(hostname -I)/phpmyadmin/ \\n"
    printf "${COLOR1} Nom d'utilisateur de la base de données MySQL: ${DBUSER}\\n"
    printf "${COLOR1} Mot de passe de connexion base de données MySQL: ${DBPASS} \\n"
    echo -en '\n'
    sleep 3
    printf "${COLOR2}💻 TOPO sur créaction de votre seveur ! \\n"
    printf "${COLOR2}💻 Chemin du dossier  : /home/fivem \\n"
    printf "${COLOR2}💻 Ne surtout pas supprime run.sh et alpine\\n"
    printf "${NC}\\n"    


cat << "EOF"
  /$$$$$$  /$$   /$$         /$$$$$$$$ /$$$$$$ /$$    /$$ /$$$$$$$$ /$$      /$$       /$$    /$$  /$$$$$$        /$$  
 /$$__  $$| $$  | $$        | $$_____/|_  $$_/| $$   | $$| $$_____/| $$$    /$$$      | $$   | $$ /$$__  $$     /$$$$  
| $$  \__/| $$  | $$        | $$        | $$  | $$   | $$| $$      | $$$$  /$$$$      | $$   | $$|__/  \ $$    |_  $$  
|  $$$$$$ | $$$$$$$$ /$$$$$$| $$$$$     | $$  |  $$ / $$/| $$$$$   | $$ $$/$$ $$      |  $$ / $$/  /$$$$$$/      | $$  
 \____  $$| $$__  $$|______/| $$__/     | $$   \  $$ $$/ | $$__/   | $$  $$$| $$       \  $$ $$/  /$$____/       | $$  
 /$$  \ $$| $$  | $$        | $$        | $$    \  $$$/  | $$      | $$\  $ | $$        \  $$$/  | $$            | $$  
|  $$$$$$/| $$  | $$        | $$       /$$$$$$   \  $/   | $$$$$$$$| $$ \/  | $$         \  $/   | $$$$$$$$ /$$ /$$$$$$
 \______/ |__/  |__/        |__/      |______/    \_/    |________/|__/     |__/          \_/    |________/|__/|______/  
EOF
