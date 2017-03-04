#!/bin/sh
WORKDIR=$(pwd)
. ${WORKDIR}/_etc/vars
######################################################################

for TAG in ${CONTAINERS};
do
  MAJOR=$(echo ${TAG} | cut -d\. -f1)
  mkdir -p ${WORKDIR}/${TAG}
  fetch    ${PROTO}://${SITE_MASTER}/pub/FreeBSD/releases/${ARCH}/${TAG}/base.txz -o ${WORKDIR}/${TAG}
  fetch    ${PROTO}://${SITE_PKG}/freebsd:${MAJOR}:${ABI}/latest/Latest/pkg.txz -o ${WORKDIR}/${TAG}
done
