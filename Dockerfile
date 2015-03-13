FROM sath89/ubuntu_jdk7

MAINTAINER Maksym Bilenko "sath891@gmail.com"

ENV DEBIAN_FRONTEND noninteractive
ENV LOGSTASH_VERSION 1.4.2
#set WEB to web to have web interface support
ENV WEB ''
ENV CONFIG input { log4j { tags => "log4j" } tcp { port => 9290 tags => "tcpin" codec => "json" } } output { elasticsearch { embedded => true } }

RUN apt-get update -q && apt-get install curl -y -q && \
    curl -sLo /tmp/logstash-${LOGSTASH_VERSION}.tar.gz https://download.elasticsearch.org/logstash/logstash/logstash-${LOGSTASH_VERSION}.tar.gz && \
    tar xf /tmp/logstash-${LOGSTASH_VERSION}.tar.gz -C /opt

RUN apt-get clean && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

CMD /opt/logstash-1.4.2/bin/logstash -e "${CONFIG}" ${WEB}

EXPOSE 9292/tcp