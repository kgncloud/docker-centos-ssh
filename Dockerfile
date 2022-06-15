# CentOS 6 with ssh + custom script to setup passwordless SSH from ClusterControl container.

FROM almalinux:latest
MAINTAINER Severalnines <info@severalnines.com>

RUN dnf -y install epel-release

RUN dnf -y install openssh-server openssh-clients passwd curl mysql socat && \
	dnf clean all

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 22 9999 3306 27107 5432
