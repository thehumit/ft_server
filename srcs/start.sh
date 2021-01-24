#phpmyadmin & wordpress
wget "https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz"
wget "https://ru.wordpress.org/latest-ru_RU.tar.gz"

tar -xvf latest-ru_RU.tar.gz
tar -xvf phpMyAdmin-5.0.4-all-languages.tar.gz
rm -rf latest-ru_RU.tar.gz phpMyAdmin-5.0.4-all-languages.tar.gz
mv phpMyAdmin-5.0.4-all-languages phpmyadmin

#nginx
mv domain.com.conf /etc/nginx/sites-available
ln -s /etc/nginx/sites-available/domain.com.conf /etc/nginx/sites-enabled
rm -rf /etc/nginx/sites-enabled/default

#mariadb
service mysql start
mariadb < db_settings

mkdir /var/www/site

mv ./phpmyadmin /var/www/site
mv ./wordpress /var/www/site

mv /var/www/site/phpmyadmin/config.sample.inc.php /var/www/site/phpmyadmin/config.inc.php
mv wp-config.php /var/www/site/wordpress
chown www-data:www-data var/www/*

#ssl

service nginx start
service php7.3-fpm start


bash
