FROM amazonlinux:2

RUN yum clean metadata; yum -y update
RUN yum -y install procps systemd-sysv initsripts
# RUN amazon-linux-extras enable python3.8
# RUN yum clean metadata; yum -y install python38
# RUN unlink /usr/bin/python
# RUN ln -s /usr/bin/python3.8 /usr/bin/python
RUN yum -y install systemd; yum clean all; \
    (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
    rm -f /lib/systemd/system/multi-user.target.wants/*;\
    rm -f /etc/systemd/system/*.wants/*;\
    rm -f /lib/systemd/system/local-fs.target.wants/*; \
    rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
    rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
    rm -f /lib/systemd/system/basic.target.wants/*;\
    rm -f /lib/systemd/system/anaconda.target.wants/*;
VOLUME [ "/sys/fs/cgroup" ]
# CMD ["/usr/sbin/init"]
CMD ["/usr/sbin/init"]