#!/bin/bash -x

##Before running this scripts create conteo conf file in directory "/var/lib/config-data/triliodm/etc/tvault-contego"

if [ ! -f /var/lib/config-data/triliodm/etc/tvault-contego/tvault-contego.conf ]; then
    echo "Before running this script, create tvault-contego.conf file in directory:\"/var/lib/config-data/triliodm/etc/tvault-contego\""
    exit 1
fi

docker run -v /var/lib/config-data/puppet-generated/nova_libvirt/etc/nova:/etc/nova:ro \
-v /var/run/libvirt/:/var/run/libvirt/ -v /var/lib/config-data/triliodm/etc/tvault-contego:/etc/tvault-contego:ro -v /usr/sbin:/usr/sbin -v /usr/bin:/usr/bin -v /bin:/bin \
-v /sbin:/sbin --network host --privileged=true \
-dt --name dm shyambiradar/trilio-datamover:queens
