FROM php:8.2-apache

# 安装 mysqli 扩展
RUN docker-php-ext-install mysqli

# 复制代码到容器网站根目录
COPY . /var/www/html/

# 启用 Apache 重写模块
RUN a2enmod rewrite

# 设置 Apache ServerName 避免警告，替换成你的域名
RUN echo "ServerName projectcarhub-production.up.railway.app" >> /etc/apache2/apache2.conf

# 暴露Railway使用的端口8080
EXPOSE 8080

# 启动 Apache 在前台运行
CMD ["apache2-foreground"]
