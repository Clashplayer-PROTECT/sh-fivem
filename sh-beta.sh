#!/bin/bash
# Script Auto Install Five M [DEV]
#=====================================================================================
# Author:   Clashplayer#2134 
#=====================================================================================
#=====================================================================================
# Root Force
# By Clashplayer#2134

#Supported systems:
supported="Ubuntu"
COLOR1='\033[0;32m'                                         #green color
COLOR2='\033[0;31m'                                         #red color
COLOR3='\33[0;33m'
COLOR4='\033[1;35m'
NC='\033[0m'                                                #no color





function installFIVEM() {
cat << "EOF"
  /$$$$$$  /$$   /$$         /$$$$$$$  /$$$$$$$$ /$$$$$$$$ /$$$$$$ 
 /$$__  $$| $$  | $$        | $$__  $$| $$_____/|__  $$__//$$__  $$
| $$  \__/| $$  | $$        | $$  \ $$| $$         | $$  | $$  \ $$
|  $$$$$$ | $$$$$$$$ /$$$$$$| $$$$$$$ | $$$$$      | $$  | $$$$$$$$
 \____  $$| $$__  $$|______/| $$__  $$| $$__/      | $$  | $$__  $$
 /$$  \ $$| $$  | $$        | $$  \ $$| $$         | $$  | $$  | $$
|  $$$$$$/| $$  | $$        | $$$$$$$/| $$$$$$$$   | $$  | $$  | $$
 \______/ |__/  |__/        |_______/ |________/   |__/  |__/  |__/                        
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
dist=`grep DISTRIB_ID /etc/*-release | awk -F '=' '{print $2}'`
    if [ "$dist" == "Ubuntu" ]; then
        printf "${COLOR1}©️  Votre système d'exploitation est pris en charge par SH-FIVEM.©️ \\n"
    else
    printf "${COLOR2}💻 Malheureusement votre système d'exploitation n'est pas pris en charge par SH-FIVEM  💻\\n"
    exit
    fi
    printf "${COLOR2}💻 Systèmes pris en charge : $supported 💻\\n"
    printf "${NC}\\n"    
    sleep 6
#############################################################################

# Prérequis installation Five M
apt update -y
apt upgrade -y
apt install sudo xz-utils git curl screen -y

#Installation de LATEST
echo
    printf "${YELLOW} LAST NEW Artifacts : Souhaitez-vous instalaltion du serveur Five M avec la version de LATEST ❓  [o/N]\\n"
    read reponse
if [[ "$reponse" == "o" ]]
then 
printf "${CYAN} Démarrage de l'instalaltion de version de LATEST pour serveur Five M !"
    cd /home/
    mkdir -p fivem
    cd /home/fivem
RELEASE_PAGE=$(curl -sSL https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/)
        if [ "${FIVEM_VERSION}" == "latest" ] || [ -z ${FIVEM_VERSION} ] ; then
LATEST_RECOMMENDED=$(echo -e "${RELEASE_PAGE}" | grep "LATEST RECOMMENDED" -B1 | grep -Eo '".*/*.tar.xz"' | grep -Eo '".*"' | sed 's/\"//g' | sed 's/\.\///1' | grep -P '\d{4}-\S{40}\/fx\.tar\.xz')
DOWNLOAD_LINK=$(echo https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/${LATEST_RECOMMENDED})
else
VERSION_LINK=$(echo -e "${RELEASE_PAGE}" | grep -Eo 'href=".*/*.tar.xz"' | grep -Eo '".*"' | sed 's/\"//g' | sed 's/\.\///1' | grep ${FIVEM_VERSION})
        if [ "${VERSION_LINK}" == "" ]; then
echo -e ""
else
DOWNLOAD_LINK=$(echo https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/${VERSION_LINK})
        fi
    fi
if [ ! -z "${DOWNLOAD_URL}" ]; then
    if curl --output /dev/null --silent --head --fail ${DOWNLOAD_URL}; then
DOWNLOAD_LINK=${DOWNLOAD_URL}
else
echo -e ""
        fi
fi

curl -sSL ${DOWNLOAD_LINK} -o ${DOWNLOAD_LINK##*/}    
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

#Installation de SYSTEMCTL TXADMIN
echo
    printf "${YELLOW} Vous souhaitez disposer d'une nouvelle technologie pour démarrer votre serveur fivem avec TXadmin ?  ❓  [o/N]\\n"
    read reponse
if [[ "$reponse" == "o" ]]
then 
printf "${CYAN} Démarrage technologie pour démarrer votre serveur fivem avec TXadmin !"
    cd /etc/systemd/system
    wget https://raw.githubusercontent.com/Clashplayer-PROTECT/sh-fivem/master/txadmin.service
    systemctl enable fivem.service
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
    apt -y install php8.0 php8.0-{cli,gd,mysql,pdo,mbstring,tokenizer,bcmath,xml,fpm,curl,zip} mariadb-server nginx tar unzip git redis-server
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

mkdir /etc/sh-fivem/
echo "SUCCES 202" > /etc/sh-fivem/sh-install


cat << "EOF"
  /$$$$$$  /$$   /$$         /$$$$$$$  /$$$$$$$$ /$$$$$$$$ /$$$$$$ 
 /$$__  $$| $$  | $$        | $$__  $$| $$_____/|__  $$__//$$__  $$
| $$  \__/| $$  | $$        | $$  \ $$| $$         | $$  | $$  \ $$
|  $$$$$$ | $$$$$$$$ /$$$$$$| $$$$$$$ | $$$$$      | $$  | $$$$$$$$
 \____  $$| $$__  $$|______/| $$__  $$| $$__/      | $$  | $$__  $$
 /$$  \ $$| $$  | $$        | $$  \ $$| $$         | $$  | $$  | $$
|  $$$$$$/| $$  | $$        | $$$$$$$/| $$$$$$$$   | $$  | $$  | $$
 \______/ |__/  |__/        |_______/ |________/   |__/  |__/  |__/
EOF
}

function SOON() {
      printf "${COLOR2}💻 Bientôt sur SH-FIVEM ! \\n"
        printf "${COLOR1} Télechargement de votre BASE depuis MEGA ! \\n"
        printf "${NC} \\n"



}

function OpenMENU() {
        printf "${COLOR3} Bienvenue sur le contrôleur SH-FIVEM ! \\n"
        printf "${COLOR2} Que voulez-vous faire ? \\n"
        echo "   1) Update votre artefact"
      	echo "   2) Création d'un nouvel utilisateur PhpMyAdmin"
        echo "   3) SOON"
	      echo "   3) Quitter"
        printf "${NC} \\n"

	until [[ ${MENU_OPTION} =~ ^[1-4]$ ]]; do
		read -rp "Sélectionnez une option [1-6]: " MENU_OPTION
	done
	case "${MENU_OPTION}" in
	1)
		UpdateArtefact
		;;
  2)
		newPHPMYADMIN
		;;
  3)
	  SOON
		;;

	4)
		exit 0
		;;
	esac
}




if [[ -e /etc/sh-fivem/sh-install ]]; then
	source /etc/sh-fivem/sh-install
	OpenMENU
else
	installFIVEM
fi
