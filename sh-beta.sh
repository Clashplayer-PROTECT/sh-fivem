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


function OpenMENU() {
        printf "${COLOR3} Bienvenue sur le contrôleur SH-FIVEM ! \\n"
        printf "${COLOR2} Que voulez-vous faire ? \\n"
        echo "   1) Création d'un serveur développement"
        echo "   2) Mettez à jour votre artefact"
        echo "   3) Installation d'une base FIVEM à partir de MEGA [BETA]"
      	echo "   4) Création d'un nouvel utilisateur PhpMyAdmin"
        echo "   5) BACKUP GOOGLE DRIVE"
	    echo "   6) Quitter"
        printf "${NC} \\n"

	until [[ ${MENU_OPTION} =~ ^[1-4]$ ]]; do
		read -rp "Sélectionnez une option [1-6]: " MENU_OPTION
	done
	case "${MENU_OPTION}" in
	1)
		installFIVEM
		;;
	2)
		UpdateArtefact
		;;

   3)
		installMEGA
		;;
   4)
		newPHPMYADMIN
		;;
    5)
		Backup-GoogleDRIVE
		;;
	6)
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
