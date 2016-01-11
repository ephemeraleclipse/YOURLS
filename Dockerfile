FROM 7.0.2-fpm
RUN apt-get update
RUN apt-get upgrade -y
COPY . /var/www/html/
COPY /var/www/html/user/config-sample.php /var/www/html/user/config.php
RUN sed -i 's/your db user name/root/' /var/www/html/user/config.php
RUN sed -i 's/\'your db password\'/getenv(\'DB_PASSWORD\')/' /var/www/html/user/config.php
RUN sed -i 's/http:\/\/your-own-domain-here.com/getenv(\'VIRTUAL_HOST\')/' /var/www/html/user/config.php
RUN sed -i 's/\'username\'/getenv(\'USERNAME\')/' /var/www/html/user/config.php
RUN sed -i 's/\'password\'/getenv(\'PASSWORD\')/' /var/www/html/user/config.php
EXPOSE 9000
