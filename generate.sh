UBUNTU_VERSIONS=(14.04 15.04 15.10)
REDIS_VERSIONS=(stable 3.0.5 3.0.4 3.0.3 3.0.2 3.0.1 3.0.0 2.8.23)


echo ${UBUNTU_VERSIONS[@]}
for UBUNTU_VERSION in "${UBUNTU_VERSIONS[@]}"
   do
    for REDIS_VERSION in "${REDIS_VERSIONS[@]}"
       do
       echo "$REDIS_VERSION/ubuntu$UBUNTU_VERSION" 
       mkdir -p $REDIS_VERSION/ubuntu$UBUNTU_VERSION
       ./Dockerfile.sh $UBUNTU_VERSION $REDIS_VERSION > $REDIS_VERSION/ubuntu$UBUNTU_VERSION/Dockerfile
       done
   done


