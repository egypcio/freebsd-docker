#!/bin/sh
######################################################################
BASE_DIR=$(dirname ${0})
. ${BASE_DIR}/_etc/vars
######################################################################
for TAG in ${CONTAINERS}; do
  cat ${BASE_DIR}/_etc/Dockerfile.head > ${BASE_DIR}/${TAG}/Dockerfile
  echo "LABEL		Description=\"FreeBSD Container (${TAG})\"" >> \
	${BASE_DIR}/${TAG}/Dockerfile
  cat ${BASE_DIR}/_etc/Dockerfile.tail >> ${BASE_DIR}/${TAG}/Dockerfile
  cd ${BASE_DIR}/${TAG}
  T=$(echo ${TAG} | tr '[:upper:]' '[:lower:]')
  /usr/local/bin/docker build --no-cache=true -f Dockerfile -t egypcio/freebsd:${T} .
done
