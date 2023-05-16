FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y bind9 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY named.conf.local /etc/bind/
COPY db.artirion.ci /etc/bind/
EXPOSE 53/tcp 53/udp
CMD ["/usr/sbin/named", "-g"]
