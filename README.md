docker-logstash
==================
Docker container with Logstash service based on [sath89/jdk7](https://registry.hub.docker.com/u/sath89/ubuntu_jdk7/)

Usage example:

    docker run -i -t --rm --dns=172.17.42.1 --name=logstash -p 9292:9292 -p 4560:4560 -p 9290:9290 sath89/logstash /opt/logstash-1.4.2/bin/logstash -e 'input { log4j { tags => "log4j" } tcp { port => 9290 tags => "tcpin" codec => "json" } } output { elasticsearch { host => "elasticsearch.domain.com" } }' web
