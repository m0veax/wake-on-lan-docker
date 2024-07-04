FROM php:8.3.8-apache

RUN sed -i 's/80/8553/g' /etc/apache2/sites-available/000-default.conf /etc/apache2/ports.conf

COPY wake-on-lan.php /var/www/html
COPY wake-on-lan.php /var/www/html

RUN docker-php-ext-install sockets
RUN docker-php-ext-enable sockets

RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

EXPOSE 8553
