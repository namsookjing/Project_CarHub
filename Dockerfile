FROM php:8.2-apache

RUN docker-php-ext-install mysqli

RUN a2enmod rewrite

RUN echo "PassEnv DB_HOST DB_USER DB_PASS DB_NAME DB_PORT" >> /etc/apache2/apache2.conf

COPY . /var/www/html/

ENV PORT=8080

RUN sed -i "s/80/\${PORT}/g" /etc/apache2/ports.conf /etc/apache2/sites-enabled/000-default.conf

EXPOSE 8080

CMD ["apache2-foreground"]
