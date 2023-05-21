FROM ubuntu

RUN apt update &&\
    apt upgrade -y &&\
    apt install -y wget unzip expect

ADD script/qBittorrrent_upgrade /qbittorrent/

ADD script/start.sh /

RUN mkdir -p /root/Downloads &&\
    mkdir -p /qbittorrent &&\
    chmod 777 -R /root/Downloads &&\
    chmod 777 /start.sh &&\
    chmod 777 /qbittorrent/qBittorrrent_upgrade &&\
    echo umask 000 >> /etc/profile

ENV QBITTORRENT_HOME /qbittorrent

ENV PATH $QBITTORRENT_HOME:$PATH

WORKDIR /root

CMD ["expect", "/start.sh"]