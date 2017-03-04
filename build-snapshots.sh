#!/bin/sh
WORKDIR=$(pwd)
. ${WORKDIR}/_etc/vars
######################################################################

CONTAINERS="10.3-STABLE 12.0-CURRENT"

for TAG in ${CONTAINERS};
do
  cat ${WORKDIR}/_etc/Dockerfile.head > ${WORKDIR}/${TAG}/Dockerfile
  echo "LABEL		Description=\"FreeBSD Container (${TAG})\"" >> \
	${WORKDIR}/${TAG}/Dockerfile
  cat ${WORKDIR}/_etc/Dockerfile.tail >> ${WORKDIR}/${TAG}/Dockerfile
  cd ${WORKDIR}/${TAG}
  T=$(echo ${TAG} | tr '[:upper:]' '[:lower:]')
  /usr/local/bin/docker build --no-cache=true -f Dockerfile -t egypcio/freebsd:${T} .
done
