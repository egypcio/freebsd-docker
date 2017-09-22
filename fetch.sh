#!/bin/sh
######################################################################
BASE_DIR=$(dirname ${0})
. ${BASE_DIR}/_etc/vars
######################################################################
for TAG in ${CONTAINERS}; do
  mkdir -p ${BASE_DIR}/${TAG}
  fetch    ${FETCH_PROTO}://${FETCH_MIRROR}/${FETCH_PATH}/${TAG}/base.txz \
	-o ${BASE_DIR}/${TAG}
done
