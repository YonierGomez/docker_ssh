FROM centos

LABEL maintainer Yonier Gómez

RUN yum -y install openssh-server passwd sudo

ENV user=remote_user \
    password=lab \
    passroot=lab

RUN useradd $user && echo $password | passwd --stdin $user && \
    echo "$user ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$user && \
    mkdir /home/$user/.ssh && chmod 700 /home/$user/.ssh

COPY remote-key.pub /home/$user/.ssh/authorized_keys

RUN chown $user:$user -R /home/$user && \
    chmod 600 /home/$user/.ssh/authorized_keys && \
    ssh-keygen -A && rm -f /run/nologin

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
