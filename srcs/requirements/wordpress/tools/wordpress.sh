#!/bin/sh
export PHP_MEMORY_LIMIT=512M
echo "Waiting for MariaDB..."
while ! mariadb -h mariadb -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE" >/dev/null 2>&1; do
    sleep 2
done
echo "MariaDB is ready."

mkdir -p /srv/www/wordpress
cd /srv/www/wordpress

if [ ! -f wp-cli.phar ]; then
    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
fi

if [ ! -f wp-config.php ]; then
    echo "Installing WordPress..."
    php -d memory_limit=512M wp-cli.phar core download --allow-root
    php -d memory_limit=512M wp-cli.phar config create \
        --dbname="$MYSQL_DATABASE" \
        --dbuser="$MYSQL_USER" \
        --dbpass="$MYSQL_PASSWORD" \
        --dbhost="mariadb" \
        --allow-root

    php -d memory_limit=512M wp-cli.phar core install \
        --url="https://$DOMAIN_NAME" \
        --title="$WORDPRESS_TITLE" \
        --admin_user="$WORDPRESS_ADMIN_USER" \
        --admin_password="$WORDPRESS_ADMIN_PASSWORD" \
        --admin_email="$WORDPRESS_ADMIN_EMAIL" \
        --allow-root

	echo "Checking Wordpress URLs..."
	php -d wp-cli.phar option update siteurl "https://$DOMAIN_NAME" --allow-root
	php -d wp-cli.phar option update home "https://$DOMAIN_NAME" --aloow-root
    
    php -d memory_limit=512M wp-cli.phar user create \
        "$WORDPRESS_USER" \
        "$WORDPRESS_EMAIL" \
        --user_pass="$WORDPRESS_PASSWORD" \
        --role=author \
        --allow-root

fi

chmod 755 /srv
chmod 755 /srv/www
chmod 755 /srv/www/wordpress
find /srv/www/wordpress -type d -exec chmod 755 {} \;
find /srv/www/wordpress -type f -exec chmod 644 {} \;
chown -R www-data:www-data /srv/www/wordpress

sed -i 's|listen = 127.0.0.1:9000|listen = 9000|' /etc/php83/php-fpm.d/www.conf

echo "Starting PHP-FPM..."
mkdir -p /var/lib/php83/sessions
chown -R www-data:www-data /var/lib/php83/sessions
chmod 755 /var/lib/php83/sessions
exec php-fpm83 -F
