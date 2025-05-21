FROM php:8.2-apache

RUN docker-php-ext-install mysqli

COPY . /var/www/html/

RUN a2enmod rewrite

EXPOSE 80

RUN echo "ServerName https://projectcarhub-production.up.railway.app/" >> /etc/apache2/apache2.conf
