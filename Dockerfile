FROM ubuntu

MAINTAINER Tyler Dixon
RUN sed -i 's/main$/main universe/' /etc/apt/sources.list && apt-get update
RUN apt-get install -y apache2 php5 php5-mysql php5-pgsql
ADD . /wiki

RUN cp /wiki/apache_config.conf /etc/apache2/apache2.conf
RUN cp /wiki/apache_wiki_vhost_config.conf /etc/apache2/sites-enabled/wiki.conf
RUN mkdir -p /var/www/wiki/
RUN cp -r /wiki/doc_root/* /var/www/wiki/

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

EXPOSE 8000

CMD ["apache2", "-D", "FOREGROUND"]
