# 1. select base image
#         ruby2.6.3 image's OS is debian10.0
FROM ruby:2.6.3

# 2. update package & install package maneger & install text editor
RUN set -x && \
        :  "package update" && \
        apt update && \
        : "install vim, nodejs(ver > 8)" && \
        curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
        apt install -y vim nodejs && \
        : "install yarn(for mysql & rails)" && \
        curl -o- -L https://yarnpkg.com/install.sh | bash

# 3. install mysql
RUN set -x && \
        : "install mysql" && \
        : "   after update, raise no installation candicate error" && \
        apt install -y default-mysql-client

# 4. rails install
RUN set -x && \
        : "create folder"&& \
        mkdir /app
WORKDIR /app
ADD ./Gemfile /app/Gemfile
ADD ./Gemfile.lock /app/Gemfile.lock
RUN set -x && \
        bundle install

# 5 unicorn setting
RUN set -x && \
        : "set unicorn"
ADD ./unicorn.rb /app/config/unicorn.rb
ADD ./unicorn.rake /app/lib/tasks/unicorn.rake
