#!/bin/sh
WORKDIR=$(pwd)
. ${WORKDIR}/_etc/vars
######################################################################

if [ $(id -u) != 0 ]; then
  echo "Please run it with root privileges."
  exit 1 
  else
    for TAG in ${CONTAINERS};
    do
      CONTAINER=${WORKDIR}/${TAG}/container
      echo "Creating FreeBSD Container for ${TAG}..."
      mkdir -p ${CONTAINER}
      tar --unlink -xpJf ${WORKDIR}/${TAG}/base.txz -C ${CONTAINER}/.
      tar --unlink -xpJf ${WORKDIR}/${TAG}/pkg.txz -C ${CONTAINER}/.
      for DIR in $(cat ${WORKDIR}/_etc/dirs);
      do
        rm -rf ${CONTAINER}/${DIR}
      done
      cp ${WORKDIR}/_etc/resolv.conf ${CONTAINER}/etc/.
      cd ${CONTAINER}
      tar -cpJf ${WORKDIR}/${TAG}/container.txz *
      chflags -R 0 ${CONTAINER}
      rm -rf ${CONTAINER}
    done
fi
echo "done."
