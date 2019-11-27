# 1. select base image
FROM mysql:5.7

# 2. update package & install text editor
RUN set -x && \
        :  "package update" && \
        apt update && \
        : "install vim" && \
        apt install -y vim
