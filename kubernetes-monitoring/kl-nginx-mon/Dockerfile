FROM nginx:mainline

RUN apt-get update && \
apt-get -y upgrade

COPY default.conf /etc/nginx/conf.d/default.conf
