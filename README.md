docker-logstash
===============
Docker container with Logstash service based on [sath89/jdk7](https://registry.hub.docker.com/u/sath89/ubuntu_jdk7/)

**Default configuration is:**

     input { log4j { tags => "log4j" } tcp { port => 9290 tags => "tcpin" codec => "json" } } output { elasticsearch { embedded => true } }
     #elastic search is embedded => true
     #for proper working of embedded elasticsearch add aditional port forwarding -p 9200:9200
     WEB='' #disabled to enabe set -e WEB=web
     
     docker run -itd -p 9292:9292 -p 4560:4560 -p 9290:9290 -p 9200:9200 -e WEB=web sath89/logstash

**Usage example1 (OLD/LowLevel):**

    docker run -i -t --rm --dns=172.17.42.1 --name=logstash -p 9292:9292 -p 4560:4560 -p 9290:9290 sath89/logstash \
     /opt/logstash-1.4.2/bin/logstash -e ' \
     input { log4j { tags => "log4j" } \
     tcp { port => 9290 tags => "tcpin" codec => "json" } } \
     output { elasticsearch { host => "elasticsearch.domain.com" } } \
     ' web

*This example uses external elasticsearch service. If you want to use embedded - the you could set `embedded => true` in the config. More info [here](http://logstash.net/docs/1.4.2/outputs/elasticsearch)*


**Usage example2:**

     docker run -i -t --rm --dns=172.17.42.1 --name=logstash -p 9292:9292 -p 4560:4560 -p 9290:9290 \
     -e CONFIG='input { log4j { tags => "log4j" } tcp { port => 9290 tags => "tcpin" codec => "json" } } output { elasticsearch { host => "elasticsearch.domain.com" }' \
     -e WEB=web \
     sath89/logstash

*If you want to use Web interface at example2 - add environment variable **'WEB=web'***

logstash-log4j-socket
=====================
Here is an example how to send logs to logstash via `log4j` in `log4j.properties` example

logstash-ncat-tcpsocket
=======================
Here is an example for tcp socket in `ncat.sh` and in `journalncat.service`
