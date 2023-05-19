FROM ubuntu

RUN apt update &&\
    apt upgrade -y &&\
    apt install -y wget unzip expect

RUN mkdir -p /qbittorrent

ENV QBITTORRENT_HOME /qbittorrent

ENV PATH $QBITTORRENT_HOME:$PATH

ADD script/qBittorrrent_upgrade /qbittorrent/

ADD script/start.sh /

WORKDIR /root

RUN mkdir -p /opt/download &&\
    chmod 777 -R /opt/download/ &&\
    chmod 777 /start.sh &&\
    chmod 777 /qbittorrent/qBittorrrent_upgrade &&\
    echo umask 000 >> /etc/profile

CMD ["expect", "/start.sh"]