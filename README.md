# Installation automatique pour un serveur fivem avec mysql sur Ubuntu 18.04

```
bash <(wget -O - 'https://raw.githubusercontent.com/Clashplayer-PROTECT/sh-fivem/master/sh-fivem.sh')
```

# Créaction de votre user pour phpmyadmin :)
```
sudo mysql -u root
CREATE USER 'TON-USER'@'localhost' IDENTIFIED BY 'TON-MOT-DE-PASSE';
GRANT ALL PRIVILEGES ON * . * TO 'TON-USER'@'localhost';
FLUSH PRIVILEGES;
quit
```
