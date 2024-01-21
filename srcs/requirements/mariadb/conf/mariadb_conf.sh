#!/bin/bash

# Terminate the script if an error occured
set -e

# Start MySQL
service mysql start

# Safe install of MySQL
if [ ! -d "/var/lib/mysql/$WP_TITLE" ]

then

mysql_secure_installation << EOF

n
y
y
y
y
EOF

# Generate the database and the user with privilege for WordPress
mysql -uroot -e "CREATE DATABASE IF NOT EXISTS $WP_TITLE;"
mysql -uroot -e "CREATE USER IF NOT EXISTS '$WP_USER_LOGIN'@'%' IDENTIFIED BY '$WP_USER_PASSWORD';"
mysql -uroot -e "GRANT ALL PRIVILEGES ON $WP_TITLE.* TO '$WP_USER_LOGIN'@'%';"
mysql -uroot -e "FLUSH PRIVILEGES;"
mysql -uroot -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"

fi

# Shudown MySQL
mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown

# Execute
exec "$@"