#!/bin/bash
# Script Auto Install Five M [DEV]
#=====================================================================================
# Author:   Clashplayer#2134 
#=====================================================================================
#=====================================================================================
# Root Force
# By Clashplayer#2134

#Supported systems:
supported="Debian 11"
COLOR1='\033[0;32m'                                         #green color
COLOR2='\033[0;31m'                                         #red color
COLOR3='\33[0;33m'
COLOR4='\033[1;35m'
NC='\033[0m'                                                #no color


function installFIVEM() {
cat << "EOF"
  /$$$$$$  /$$   /$$         /$$$$$$$$ /$$$$$$ /$$    /$$ /$$$$$$$$ /$$      /$$         /$$    /$$  /$$$$$$ 
 /$$__  $$| $$  | $$        | $$_____/|_  $$_/| $$   | $$| $$_____/| $$$    /$$$        | $$   | $$ /$$__  $$
| $$  \__/| $$  | $$        | $$        | $$  | $$   | $$| $$      | $$$$  /$$$$        | $$   | $$|__/  \ $$
|  $$$$$$ | $$$$$$$$ /$$$$$$| $$$$$     | $$  |  $$ / $$/| $$$$$   | $$ $$/$$ $$ /$$$$$$|  $$ / $$/   /$$$$$/
 \____  $$| $$__  $$|______/| $$__/     | $$   \  $$ $$/ | $$__/   | $$  $$$| $$|______/ \  $$ $$/   |___  $$
 /$$  \ $$| $$  | $$        | $$        | $$    \  $$$/  | $$      | $$\  $ | $$          \  $$$/   /$$  \ $$
|  $$$$$$/| $$  | $$        | $$       /$$$$$$   \  $/   | $$$$$$$$| $$ \/  | $$           \  $/   |  $$$$$$/
 \______/ |__/  |__/        |__/      |______/    \_/    |________/|__/     |__/            \_/     \______/ 
                                                                                                             
EOF
#Supported systems:
supported="Debian 11"
COLOR1='\033[0;32m'                                         #green color
COLOR2='\033[0;31m'                                         #red color
COLOR3='\33[0;33m'
NC='\033[0m'                                                #no color

 if [ "$(id -u)" != "0" ]; then
         printf "${RED}ERREUR : SH-FIVEM  n'a pas accès root. ⛔️\\n" 1>&2
         printf "\\n"
         exit 1
 fi

 
     printf "${COLOR1}   \\n"
    printf "${COLOR1}©️  Copyright Tous droits réservés.©️ \\n"
        printf "${COLOR1}PROD : v2.4.2 \\n"
dist=`grep DISTRIB_ID /etc/*-release | awk -F '=' '{print $2}'`
 #   if [ "$dist" == "Ubuntu" ]; then
  #      printf "${COLOR1}©️  Votre système d'exploitation est pris en charge par SH-FIVEM.©️ \\n"
   # else
    # printf "${COLOR2}💻 Malheureusement votre système d'exploitation n'est pas pris en charge par SH-FIVEM  💻\\n"
   # exit
  #  fi
    printf "${COLOR2}💻 Systèmes pris en charge : $supported 💻\\n"
    printf "${NC}\\n"    
    sleep 6
#############################################################################

# Prérequis installation Five M
apt update -y
apt upgrade -y
apt install sudo xz-utils  screen jq zip -y
chmod 777 sh-fivem.sh

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
# Récup grâce pterodactyl eggs
RELEASE_PAGE=$(curl -sSL https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/)
CHANGELOGS_PAGE=$(curl -sSL https://changelogs-live.fivem.net/api/changelog/versions/linux/server)

if [[ "${FIVEM_VERSION}" == "latest" ]] || [[ -z ${FIVEM_VERSION} ]]; then
  DOWNLOAD_LINK=$(echo $CHANGELOGS_PAGE | jq -r '.latest_download')
else
  VERSION_LINK=$(echo -e "${RELEASE_PAGE}" | grep -Eo '".*/*.tar.xz"' | grep -Eo '".*"' | sed 's/\"//g' | sed 's/\.\///1' | grep ${CFX_VERSION})
  if [[ "${VERSION_LINK}" == "" ]]; then
    echo -e "defaulting to latest as the version requested was invalid."
    DOWNLOAD_LINK=$(echo $CHANGELOGS_PAGE | jq -r '.latest_download')
  else
    DOWNLOAD_LINK=$(echo https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/${VERSION_LINK})
  fi
fi



curl -sSL ${DOWNLOAD_LINK} -o ${DOWNLOAD_LINK##*/}

    tar xvfJ fx.tar.xz
    # Suppression du cache automatique
    # sed -i '1irm -r cache' run.sh
    rm fx.tar.xz
fi
sleep 2




# Installation MARIADB
echo
printf "${CYAN} Démarrage de l'instalaltion de MariaDB pour serveur FiveM !"
    apt  install lsb-release apt-transport-https ca-certificates -y
    sudo wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/php.list
    apt update -y
    apt install php8.1 -y
    apt -y install php8.1-{cli,gd,mysql,pdo,mbstring,tokenizer,bcmath,xml,fpm,curl,zip} apache2 mariadb-server tar unzip git -y
    php -v
    curl -sS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | sudo bash
    apt update -y

printf "${CYAN} Ready MYSQL !"


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

    PHPMYADMIN_VER=$(curl -s "https://api.github.com/repos/phpmyadmin/phpmyadmin/releases/latest" | grep -m1 '^[[:blank:]]*"name":' | cut -d \" -f 4)
    mkdir -p /usr/share/phpmyadmin/ || exit
    wget https://files.phpmyadmin.net/phpMyAdmin/"$PHPMYADMIN_VER"/phpMyAdmin-"$PHPMYADMIN_VER"-all-languages.tar.gz -O /usr/share/phpmyadmin/phpMyAdmin-"$PHPMYADMIN_VER"-all-languages.tar.gz
    tar xzf /usr/share/phpmyadmin/phpMyAdmin-"$PHPMYADMIN_VER"-all-languages.tar.gz --strip-components=1 --directory /usr/share/phpmyadmin
    rm -f /usr/share/phpmyadmin/phpMyAdmin-"$PHPMYADMIN_VER"-all-languages.tar.gz
    # Create phpMyAdmin TempDir
    mkdir -p /usr/share/phpmyadmin/tmp || exit
    chown www-data:www-data /usr/share/phpmyadmin/tmp
    chmod 700 /usr/share/phpmyadmin/tmp
    randomBlowfishSecret=$(openssl rand -base64 22)
    sed -e "s|cfg\['blowfish_secret'\] = ''|cfg['blowfish_secret'] = '$randomBlowfishSecret'|" /usr/share/phpmyadmin/config.sample.inc.php >/usr/share/phpmyadmin/config.inc.php
    ln -s /usr/share/phpmyadmin /var/www/phpmyadmin
      wget -O /etc/apache2/sites-available/phpmyadmin.conf https://raw.githubusercontent.com/MaximeMichaud/Azuriom-install/master/conf/apache2/phpmyadmin.conf
      a2ensite phpmyadmin
      systemctl restart apache2 ## By MaximeMichaud | par manque de temps pour cette version j'ai pris de ce github le code de phpmyadmin

fi



echo -e "Configuration de la utilisateur"
  echo "Mettre le mot de passe root de MySQL"
  sleep 2
  mysql -e "CREATE USER '${DBUSER}'@'localhost' IDENTIFIED BY '${DBPASS}';"
  mysql -e "CREATE DATABASE ${DBNAME};"
  mysql -p -e "GRANT ALL PRIVILEGES ON * . * TO '${DBUSER}'@'localhost';"
  mysql -e "FLUSH PRIVILEGES;"
  

  sleep 3

mkdir /etc/sh-fivem/
echo "SUCCES 202" > /etc/sh-fivem/sh-install

    printf "${COLOR3} L'installation est terminée ! \\n"
    printf "${COLOR3} Mon discord : https://discord.gg/Bx5UUV54mu \\n"
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
    printf "${COLOR2}💻 Besoin d'update votre Artefact : ./sh-fivem.sh\\n"
   printf "${NC}\\n"    

}


function UpdateArtefact () {
      printf "${YELLOW} LAST NEW Artifacts : Téléchargement de la dernière version LATEST \\n"
            printf "${YELLOW} Attention votre serveur doit être éteint, si ce n'est pas le cas : CTRL + C \\n"
          pause 20
 cd /home/fivem/
 rm -rf alpine/
 RELEASE_PAGE=$(curl -sSL https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/)
CHANGELOGS_PAGE=$(curl -sSL https://changelogs-live.fivem.net/api/changelog/versions/linux/server)

if [[ "${FIVEM_VERSION}" == "latest" ]] || [[ -z ${FIVEM_VERSION} ]]; then
  DOWNLOAD_LINK=$(echo $CHANGELOGS_PAGE | jq -r '.latest_download')
else
  VERSION_LINK=$(echo -e "${RELEASE_PAGE}" | grep -Eo '".*/*.tar.xz"' | grep -Eo '".*"' | sed 's/\"//g' | sed 's/\.\///1' | grep ${CFX_VERSION})
  if [[ "${VERSION_LINK}" == "" ]]; then
    echo -e "defaulting to latest as the version requested was invalid."
    DOWNLOAD_LINK=$(echo $CHANGELOGS_PAGE | jq -r '.latest_download')
  else
    DOWNLOAD_LINK=$(echo https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/${VERSION_LINK})
    
  fi
fi



curl -sSL ${DOWNLOAD_LINK} -o ${DOWNLOAD_LINK##*/}

    tar xvfJ fx.tar.xz
    # Suppression du cache automatique
    # sed -i '1irm -r cache' run.sh
    rm fx.tar.xz
       printf "${NC}\\n"    
           printf "${COLOR3} Fin de la mise à jour, votre serveur est mis à niveau ! \\n"


}

function OpenMENU() {
        printf "${COLOR3} Bienvenue sur le contrôleur SH-FIVEM ! \\n"
        printf "${COLOR2} Que voulez-vous faire ? \\n"
        echo "   1) Update votre artefact"
      	#echo "   2) Création d'un nouvel utilisateur PhpMyAdmin - Pas encore disponible"
	echo "   2) Quitter"
        printf "${NC} \\n"

	until [[ ${MENU_OPTION} =~ ^[1-2]$ ]]; do
		read -rp "Sélectionnez une option [1-3]: " MENU_OPTION
	done
	case "${MENU_OPTION}" in
	1)
		UpdateArtefact
		;;
  45)
		newPHPMYADMIN
		;;
	2)
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
