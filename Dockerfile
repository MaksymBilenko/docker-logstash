FROM sath89/docker-ubuntu-jdk:latest

MAINTAINER Maksym Bilenko "sath891@gmail.com"

ENV DEBIAN_FRONTEND noninteractive
ENV LOGSTASH_VERSION 1.5.0
ENV CONFIG input { log4j { tags => "log4j" } tcp { port => 9290 tags => "tcpin" codec => "json" } } output { elasticsearch { embedded => true } }

RUN apt-get update -q && apt-get install curl -y -q && \
    curl -sLo /tmp/logstash-${LOGSTASH_VERSION}.tar.gz https://download.elasticsearch.org/logstash/logstash/logstash-${LOGSTASH_VERSION}.tar.gz && \
    tar xf /tmp/logstash-${LOGSTASH_VERSION}.tar.gz -C /opt && \
    apt-get clean && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

CMD /opt/logstash-${LOGSTASH_VERSION}/bin/logstash -e "${CONFIG}"

EXPOSE 9292/tcp
