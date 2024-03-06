#!/bin/bash

# Telecharge les fichier WordPress
wp core download --allow-root

sleep 10

#Creation de la configuration de WordPress
wp config create --dbname=$MYSQL_DATABASE \
                --dbuser=$MYSQL_USER \
                --dbpass=$MYSQL_PASSWORD \
                --dbhost=$WORDPRESS_DB_HOST \
                --dbprefix=wp_ --allow-root

# Install WordPress
wp core install --allow-root \
  --url="$DOMAIN_NAME" \
  --title="My Inception !" \
  --admin_user="$WORDPRESS_ADMIN_NAME" \
  --admin_password="$WORDPRESS_ADMIN_PASSWORD" \
  --admin_email="$WORDPRESS_ADMIN_EMAIL"

wp user create --allow-root \
  "$WORDPRESS_USER_NAME" "$WORDPRESS_USER_EMAIL" \
  --user_pass="$WORDPRESS_USER_PASSWORD" \
  --role=subscriber

chown -R www-data:www-data /var/www/html/

# Demarrage PHP-FPM
/usr/sbin/php-fpm8.2 -F