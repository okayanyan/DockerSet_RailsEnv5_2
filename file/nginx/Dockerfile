FROM nginx:1.16
RUN apt-get update && \
    apt-get install -y apt-utils \
                       locales \
		       vim && \
    echo "ja_JP.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen ja_JP.UTF-8
ENV LC_ALL ja_JP.UTF-8
RUN mkdir /etc/nginx/sites-available && \
    mkdir /etc/nginx/sites-enabled && \
    mkdir /var/www/ && \
    mkdir /var/www/app/ && \
    mkdir /var/www/app/tmp/
ADD ./nginx.conf /etc/nginx
ADD ./app.conf /etc/nginx/conf.d
RUN mv -f /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf_   && \ 
          /bin/bash -c "service nginx restart"
