FROM lancachenet/ubuntu-nginx:latest
MAINTAINER TheBinaryLoop
ARG DEBIAN_FRONTEND=noninteractive

RUN \
  apt-get -y update && apt-get -y upgrade && \
  apt-get -y install sniproxy && \
  apt-get -y clean && \
  rm -rf /var/lib/apt/lists/*
  
ENV \
  SUPERVISORD_EXIT_ON_FATAL=1 \
  LC_ALL=en_GB.UTF-8 \
  LANG=en_GB.UTF-8 \
  LANGUAGE=en_GB.UTF-8 \
  TZ=Europe/London
  
COPY overlay/ /

RUN \
    chmod 777 /opt/sniproxy/startsniproxy.sh && \
    chmod -R 755 /init /hooks

EXPOSE 80 443