FROM php:8.2-apache

RUN docker-php-ext-install mysqli

RUN a2enmod rewrite

RUN echo "ServerName projectcarhub-production.up.railway.app" >> /etc/apache2/apache2.conf

COPY . /var/www/html/

EXPOSE 80

CMD ["apache2-foreground"]
