FROM php:8.2-apache

RUN docker-php-ext-install mysqli

RUN a2enmod rewrite

RUN echo "PassEnv DB_HOST DB_USER DB_PASS DB_NAME DB_PORT" >> /etc/apache2/apache2.conf

WORKDIR /var/www/html

COPY . /var/www/html

RUN chown -R www-data:www-data /var/www/html

EXPOSE 80
