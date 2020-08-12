FROM centos:7

RUN mkdir -p /app
WORKDIR /app
COPY . /app
RUN chmod +x pre-requisities.sh
RUN ./pre-requisities.sh
RUN yum -y install httpd php php-mysql php-gd php-xml php-mbstring; systemctl enable httpd

WORKDIR /var/www

RUN wget https://releases.wikimedia.org/mediawiki/1.34/mediawiki-1.34.2.tar.gz \
  && wget https://releases.wikimedia.org/mediawiki/1.34/mediawiki-1.34.2.tar.gz.sig \
  && tar -zxf mediawiki-1.34.2.tar.gz \
  && ln -s mediawiki-1.34.2/ mediawiki 

COPY httpd.conf /etc/httpd/conf/httpd.conf

RUN ln -s mediawiki-1.34.2/ mediawiki \
  && chown -R apache:apache /var/www/mediawiki-1.34.2 \
  && chown -R apache:apache /var/www/mediawiki

CMD ["/usr/sbin/apachectl","-D","FOREGROUND"]
EXPOSE 80
  
