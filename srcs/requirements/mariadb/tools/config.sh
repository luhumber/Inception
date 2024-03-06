#!/bin/bash

# Start le serveur MariaDb et & pour s'executait en arriere plan
mysqld_safe &

sleep 10

# Cree la Database
mysql -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"

# Cree un nouvel user
mysql -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"

# Accorde touts les privilleges
mysql -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO $MYSQL_USER@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"

# Recharger les privileges
mysql -e "FLUSH PRIVILEGES;"

# Arret du systeme propre et secure
mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown

# Redemarrer
mysqld_safe 