FROM php:8.2-apache

# 安装 mysqli 扩展
RUN docker-php-ext-install mysqli

# 启用 Apache mod_rewrite（如果有用）
RUN a2enmod rewrite

# 把当前目录的代码拷贝到容器中
COPY . /var/www/html/

# 设置默认 Apache 监听的环境变量端口（Railway 需要）
ENV PORT=8080

# 修改 Apache 配置以监听 $PORT 环境变量（非常关键）
RUN sed -i "s/80/\${PORT}/g" /etc/apache2/ports.conf /etc/apache2/sites-enabled/000-default.conf

# 开放端口
EXPOSE 8080

CMD ["apache2-foreground"]
