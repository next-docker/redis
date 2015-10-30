PARAM_UBUNTU_VERSION=$1
PARAM_JDK_VERSION=$2
PARAM_REDIS_VERSION=$3

OIFS=$IFS
IFS='.' read -ra JDK_VERSION_ARRAY <<< "$PARAM_JDK_VERSION"

echo "FROM ping2ravi/jdk:${PARAM_JDK_VERSION}_ubuntu.${PARAM_UBUNTU_VERSION}"
echo ""
echo ""

echo "MAINTAINER Ravi Sharma"

echo ""
echo ""
echo "# Ubuntu ${PARAM_UBUNTU_VERSION}"
echo "# Java Version ${JDK_VERSION_ARRAY[0]} update ${JDK_VERSION_ARRAY[1]}"
echo "# Redis Version ${PARAM_REDIS_VERSION}" 
echo "#     http://download.redis.io/releases/"

echo ""
echo ""
echo "ENV REDIS_VERSION $PARAM_REDIS_VERSION"

echo "ENV REDIS_HOME /opt/redis/redis-\${REDIS_VERSION}"
echo "ENV REDIS_FILE_NAME redis-\${REDIS_VERSION}"

echo ""
echo "RUN  apt-get install -y build-essential && apt-get install -y software-properties-common && apt-get install -y byobu curl git htop man unzip vim wget && wget -O \${REDIS_FILE_NAME}.tar.gz http://download.redis.io/releases/\${REDIS_FILE_NAME}.tar.gz;gunzip \${REDIS_FILE_NAME}.tar.gz; tar -xvf \${REDIS_FILE_NAME}.tar; mkdir -p \${REDIS_HOME};mv \${REDIS_FILE_NAME}/* \${REDIS_HOME}; rm \${REDIS_FILE_NAME}.tar; rm -fR \${REDIS_FILE_NAME}; cd \${REDIS_HOME} ; make && make install && cp -f src/redis-sentinel /usr/local/bin && mkdir -p /etc/redis && cp -f *.conf /etc/redis && sed -i 's/^\(bind .*\)$/# \1/' /etc/redis/redis.conf && sed -i 's/^\(daemonize .*\)$/# \1/' /etc/redis/redis.conf && sed -i 's/^\(dir .*\)$/# \1\ndir \/data/' /etc/redis/redis.conf && sed -i 's/^\(logfile .*\)$/# \1/' /etc/redis/redis.conf"

echo "# Define mountable directories."
echo "VOLUME [\"/data\"]"

echo "# Define working directory."
echo "WORKDIR /data"
echo ""
echo ""
echo "ENV PATH \${PATH}:\${REDIS_HOME}/bin"
echo "EXPOSE 6379"
echo ""
echo "CMD [\"redis-server\", \"/etc/redis/redis.conf\"]" 

IFS=$OIFS
