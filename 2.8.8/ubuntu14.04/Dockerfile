FROM ping2ravi/ubuntu:14.04


MAINTAINER Ravi Sharma


# Ubuntu 14.04
# Redis Version 2.8.8
#     http://download.redis.io/releases/


ENV REDIS_VERSION 2.8.8
ENV REDIS_HOME /opt/redis/redis-${REDIS_VERSION}
ENV REDIS_FILE_NAME redis-${REDIS_VERSION}

RUN  apt-get update && apt-get install -y build-essential && apt-get install -y software-properties-common && apt-get install -y byobu curl git htop man unzip vim wget && wget -O ${REDIS_FILE_NAME}.tar.gz http://download.redis.io/releases/${REDIS_FILE_NAME}.tar.gz;gunzip ${REDIS_FILE_NAME}.tar.gz; tar -xvf ${REDIS_FILE_NAME}.tar; mkdir -p ${REDIS_HOME};mv ${REDIS_FILE_NAME}/* ${REDIS_HOME}; rm ${REDIS_FILE_NAME}.tar; rm -fR ${REDIS_FILE_NAME}; cd ${REDIS_HOME} ; make && make install && cp -f src/redis-sentinel /usr/local/bin && mkdir -p /etc/redis && cp -f *.conf /etc/redis && sed -i 's/^\(bind .*\)$/# \1/' /etc/redis/redis.conf && sed -i 's/^\(daemonize .*\)$/# \1/' /etc/redis/redis.conf && sed -i 's/^\(dir .*\)$/# \1\ndir \/data/' /etc/redis/redis.conf && sed -i 's/^\(logfile .*\)$/# \1/' /etc/redis/redis.conf
# Define mountable directories.
VOLUME ["/data"]
# Define working directory.
WORKDIR /data


ENV PATH ${PATH}:${REDIS_HOME}/src
EXPOSE 6379

CMD ["redis-server", "/etc/redis/redis.conf"]
