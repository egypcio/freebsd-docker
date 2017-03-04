FROM		scratch
MAINTAINER	Vinicius Zavam <egypcio@googlemail.com>
LABEL		Description="FreeBSD Container with Tor 2.8.5-rc (12.0-CURRENT, r304431)"
USER		root
ADD		container.txz	/
COPY		rc.conf		/etc/
COPY		resolv.conf	/etc/
COPY		torrc		/usr/local/etc/tor/
EXPOSE		9501/tcp
EXPOSE		9530/tcp
CMD		["/bin/sh"]
