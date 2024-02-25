FROM centos/systemd

RUN yum install -y openssh-server

RUN ssh-keygen -A

RUN echo 'root:secret_pass' | chpasswd

RUN useradd -m docker && \
    echo 'docker:docker' | chpasswd && \
    mkdir /home/docker/.ssh && \
    chmod 700 /home/docker/.ssh

COPY id_rsa.pub /home/docker/.ssh/authorized_keys
RUN chown docker:docker /home/docker/.ssh/authorized_keys && \
    chmod 600 /home/docker/.ssh/authorized_keys

CMD ["/usr/sbin/sshd", "-D"]
