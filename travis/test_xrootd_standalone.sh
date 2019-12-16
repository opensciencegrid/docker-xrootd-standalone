#!/bin/bash -xe                                                                                                                                                             
# Script for testing docker xrootd standalone images

docker run --rm \
       --publish 1094:1094 \
       --volume $(pwd)/travis/test_file:/tmp/docker_xrootd_standalone/test_file \
       --name test_origin opensciencegrid/xrootd-standalone:fresh &
docker ps
sleep 20

#online_md5="$(curl -sL http://localhost:1094/stashcache-travis-ci-test/test_file | md5sum | cut -d ' ' -f 1)"
#local_md5="$(md5sum $(pwd)/travis/stashcache-origin-config/test_file | cut -d ' ' -f 1)"
#if [ "$online_md5" != "$local_md5" ]; then
#    echo "MD5sums do not match on origin"
#    exit 1
#fi
