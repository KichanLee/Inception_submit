#! bin/sh

if [ ! -f "/var/www/html/wp-config.php" ]; then
	mkdir -p /var/www/html
    cd /var/www/html
    wp core download --allow-root
    echo "core after"
    wp config create --dbname=$MYSQL_NAME --dbuser=$WORDPRESS_ADMIN_NAME --dbpass=$WORDPRESS_ADMIN_PASSWORD --dbhost=$WORDPRESS_DB_HOST --path=/var/www/html --allow-root
    echo "config create "
    wp core install --url=localhost --title="Inception" --admin_user=$WORDPRESS_ADMIN_NAME --admin_password=$WORDPRESS_ADMIN_PASSWORD --admin_email=$WORDPRESS_ADMIN_EMAIL --path=/var/www/html --allow-root
    wp user create $WORDPRESS_USER_NAME $WORDPRESS_USER_EMAIL --user_pass=$WORDPRESS_USER_PASSWORD --role="author" --path=/var/www/html --allow-root
else
    echo "WordPress is already installed."
fi
exec php-fpm81 -F