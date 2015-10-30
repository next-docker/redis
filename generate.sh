UBUNTU_VERSIONS=(14.04 15.04 15.10)
JDK_VERSIONS=(oracle_jdk7.80.15 oracle_jdk8.66.17)
REDIS_VERSIONS=(stable 3.0.5 3.0.4 3.0.3 3.0.2 3.0.1 3.0.0 2.8.23)


echo ${UBUNTU_VERSIONS[@]}
for UBUNTU_VERSION in "${UBUNTU_VERSIONS[@]}"
   do
   for JDK_VERSION in "${JDK_VERSIONS[@]}"
      do
      for REDIS_VERSION in "${REDIS_VERSIONS[@]}"
         do
         echo "$REDIS_VERSION/$JDK_VERSION/ubuntu$UBUNTU_VERSION" 
         mkdir -p $REDIS_VERSION/$JDK_VERSION/ubuntu$UBUNTU_VERSION
         ./Dockerfile.sh $UBUNTU_VERSION $JDK_VERSION $REDIS_VERSION > $REDIS_VERSION/$JDK_VERSION/ubuntu$UBUNTU_VERSION/Dockerfile
         done
      done 
   done


