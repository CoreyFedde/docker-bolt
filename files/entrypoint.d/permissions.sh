#!/bin/sh
chown -R www-data:www-data /var/www
chmod -R g+w /var/www
chmod -R 777 /var/www/app /var/www/files /var/www/extensions /var/www/theme
chmod -R +s /var/www
