# This is the output of "runlike trilio_datamover". It contains lots of stuff
# that would be set by default if omitted. Note the volume mounts though in
# particular.

docker run --name=trilio_datamover --hostname=node001 --user=nova --env=PATH=/var/lib/kolla/venv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin --env=PIP_INDEX_URL=http://mirror.iad.rax.openstack.org:8080/pypi/simple --env=PIP_TRUSTED_HOST=mirror.iad.rax.openstack.org --env=KOLLA_BASE_DISTRO=ubuntu --env=KOLLA_INSTALL_TYPE=source --env=KOLLA_INSTALL_METATYPE=mixed --env='PS1=$(tput bold)($(printenv KOLLA_SERVICE_NAME))$(tput sgr0)[$(id -un)@$(hostname -s) $(pwd)]$ ' --env=DEBIAN_FRONTEND=noninteractive --volume=/etc/kolla/datamover/ceph.conf:/etc/ceph/ceph.conf --volume=nova_compute:/var/lib/nova/:rw --volume=/etc/kolla/datamover/start_datamover_nfs:/opt/tvault/start_datamover_nfs --volume=/etc/kolla/datamover/nova.conf:/etc/nova/nova.conf --volume=/etc/kolla/datamover/tvault-contego.conf:/etc/tvault-contego/tvault-contego.conf --volume=/dev:/dev:rw --volume=/etc/kolla/datamover/ceph.client.nova.keyring:/etc/ceph/ceph.client.nova.keyring --volume=iscsi_info:/etc/iscsi:rw --volume=/var/run/libvirt --network=host --privileged --restart=no --label kolla_version="5.0.5" --label name="kolla/openstack-nova-compute-triliodata-plugin" --label description="13.0 nova-compute TrilioData Datamover" --label build-date="20190416" --label vendor="TrilioData" --label summary="nova-compute TrilioData Datamover" --label release="3.1" --label maintainer="shyam.biradar@trilio.io" --label version="3.1.0" --log-opt max-size=10m --detach=true kolla/ubuntu-source-trilio-datamover:pike /var/lib/kolla/venv/bin/python /usr/bin/tvault-contego --config-file=/etc/nova/nova.conf --config-file=/etc/tvault-contego/tvault-contego.conf