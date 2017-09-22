#!/bin/sh
######################################################################
BASE_DIR=$(dirname ${0})
. ${BASE_DIR}/_etc/vars
######################################################################
if [ $(id -u) != 0 ]; then
  echo "Please run it with root privileges."
  exit 1 
  else
    for TAG in ${CONTAINERS};
    do
      CONTAINER=${BASE_DIR}/${TAG}/container
      echo "Creating FreeBSD Container for ${TAG}..."
      mkdir -p ${CONTAINER}
      tar --unlink -xpJf ${BASE_DIR}/${TAG}/base.txz -C ${CONTAINER}/.
      for DIR in $(cat ${BASE_DIR}/_etc/dirs);
      do
        rm -rf ${CONTAINER}/${DIR}
      done
      cd ${CONTAINER}
      tar -cpJf ${BASE_DIR}/${TAG}/container.txz *
      chflags -R 0 ${CONTAINER}
      rm -rf ${CONTAINER}
    done
fi
