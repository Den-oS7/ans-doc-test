FROM centos/systemd

RUN yum install -y openssh-server

RUN ssh-keygen -A

RUN echo 'root:secret_pass' | chpasswd

RUN useradd -m doc && \
    echo 'doc:doc' | chpasswd && \
    mkdir /home/doc/.ssh && \
    chmod 700 /home/doc/.ssh

COPY id_rsa.pub /home/doc/.ssh/authorized_keys
RUN chown doc:doc /home/doc/.ssh/authorized_keys && \
    chmod 600 /home/doc/.ssh/authorized_keys

CMD ["/usr/sbin/sshd", "-D"]
