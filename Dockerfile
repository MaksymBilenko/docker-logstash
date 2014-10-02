FROM sath89/ubuntu_jdk7

MAINTAINER Maksym Bilenko "sath891@gmail.com"

ENV DEBIAN_FRONTEND noninteractive
ENV LOGSTASH_VERSION 1.4.2

RUN apt-get update -q && apt-get install curl -y -q && \
    curl -sLo /tmp/logstash-${LOGSTASH_VERSION}.tar.gz https://download.elasticsearch.org/logstash/logstash/logstash-${LOGSTASH_VERSION}.tar.gz && \
    tar xf /tmp/logstash-${LOGSTASH_VERSION}.tar.gz -C /opt
    
EXPOSE 9292/tcp
