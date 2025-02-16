FROM ubuntu

RUN apt update &&\
    apt upgrade -y &&\
    apt install -y wget unzip

ENV QBITTORRENT_HOME=/qbittorrent

ENV PATH=$QBITTORRENT_HOME:$PATH

ADD script/upgrade.sh /

WORKDIR /root

RUN mkdir -p /opt/download &&\
    mkdir -p /qbittorrent &&\
    chmod 777 -R /opt/download/ &&\
    chmod 777 /upgrade.sh &&\
    echo umask 000 >> /etc/profile

RUN /upgrade.sh

RUN rm -rf /upgrade.sh

CMD ["qbittorrent-nox", "--confirm-legal-notice"]
