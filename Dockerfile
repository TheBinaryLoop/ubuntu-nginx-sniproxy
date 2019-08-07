FROM lancachenet/ubuntu-nginx:latest
MAINTAINER TheBinaryLoop
ARG DEBIAN_FRONTEND=noninteractive

RUN \
  apt-get -y update && apt-get -y upgrade && \
  apt-get -y install sniproxy && \
  apt-get -y clean && \
  rm -rf /var/lib/apt/lists/*
  
ENV UPSTREAM_DNS 8.8.8.8 8.8.4.4
  
COPY overlay/ /

RUN \
    chmod 777 /opt/sniproxy/startsniproxy.sh && \
    chmod -R 755 /init /hooks

EXPOSE 80 443