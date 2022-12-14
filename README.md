# Installation automatique pour un serveur fivem avec mysql sur Ubuntu 18.04

Fatigué d'être géré par un hébergeur GAME et vous souhaitez avoir un VPS ou un serveur dédié pour votre serveur sous LINUX.
Mais vous savez qu'il est compliqué de gérer un serveur linux avec l'installation de MYSQL, PHPMYADMIN, Artefacts LATEST RECOMMENDED FIVEM, la création d'un identifiant MYSQL pour PHPMYADMIN.

Mais vous avez SH-FIVEM qui est un script installant correctement votre serveur avec UPDATE en cas de nouveaux artefacts ou de nouvelles dépendances. 

Alors arrêtez de faire les fous avec échec de l'installation en raison d'une documentation périmée !

Ce script est révolutionnaire avec la technologie sans screen, en cas de problème sur votre serveur linux et que vous êtes obligé de redémarrer par la commande : [bash  /home/fivem/run.sh +exec server.cfg  ] plus besoin avec la technoligy cela est automatique !

 Si vous avez besoin d'aide ou avez une question sur le script, contactez-moi sur discord par Clashplayer#2134

Psss merci à MathiAs2Pique pour les quelques modifications :)



# Si BASH n'est pas installé :
```
apt install bash
```

# Lien de l'installation :
```
bash <(wget -O - 'https://raw.githubusercontent.com/Clashplayer-PROTECT/sh-fivem/master/sh-fivem.sh')
```

# Lien de l'installation BETA :
```
bash <(wget -O - 'https://raw.githubusercontent.com/Clashplayer-PROTECT/sh-fivem/master/sh-beta.sh')
```


# Start & Restart & Stop & Status votre serveur avec la nouvelle technologie !
```
systemctl fivem start

systemctl fivem restart

systemctl fivem stop

systemctl fivem status
```


# Vous souhaitre crée un deuxième user ?
```
sudo mysql -u root
CREATE USER 'TON-USER'@'localhost' IDENTIFIED BY 'TON-MOT-DE-PASSE';
GRANT ALL PRIVILEGES ON *.* TO 'TON-USER'@'localhost';
FLUSH PRIVILEGES;
quit
```

# SOON V3
Disponible sous VERSION UBUNTU 21.04
UPGRADE Version PHP 7.0 vers 8.0


## Démarage de votre serveur sans la nouvelle technologie !
```
cd /home/fivem
bash /home/fivem/run.sh +exec server.cfg
```
Durée de l'installation sur un VPS OVH : 04:49.625


# FIN DE LA MAINTENANCE SYSTEME DE UBUNTU 18.04
# 01/02/2023
# Passage sous DEBIAN 11.5
