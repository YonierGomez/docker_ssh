FROM centos

MAINTAINER Yonier Gómez yonieer13@gmail.com

LABEL ssh: v1

RUN yum -y install openssh openssh-server openssh-clients openssl-libs \ 
    net-tools bind-utils vim sudo

ENV user=labo \
    password=labo \
    passroot=labo

RUN useradd $user && echo $password | passwd --stdin $user && \
    echo $passroot | passwd --stdin root && \
    echo "$user ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$user && \
    ssh-keygen -A

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
