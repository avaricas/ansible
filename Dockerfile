FROM amazonlinux:2

RUN yum clean metadata; yum -y update
RUN yum -y install procps systemd-sysv initsripts

CMD ["/usr/sbin/init"]