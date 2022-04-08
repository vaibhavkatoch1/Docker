FROM ubuntu
RUN apt-get update -y
RUN apt-get update && apt-get install -y tzdata
RUN ln -snf /usr/share/zoneinfo/$CONTAINER_TIMEZONE /etc/localtime && echo $CONTAINER_TIMEZONE > /etc/timezone
#RUN apt-get install apache2 -y
RUN apt-get install mysql-client mysql-server -y
RUN apt-get install php libapache2-mod-php php-mysql php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip -y
RUN apt-get install systemctl -y
RUN systemctl restart apache2
RUN apt-get install wget && apt-get install zip -y
RUN wget -c http://wordpress.org/latest.tar.gz
RUN tar -xzvf latest.tar.gz
RUN mv wordpress/* /var/www/html/
RUN rm -rf /var/www/html/index.html
RUN chown -R www-data:www-data /var/www/html/
RUN chmod -R 755 /var/www/html/
EXPOSE 80
CMD ["apache2ctl","-D", "FOREGROUND"]

