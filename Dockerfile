FROM ubuntu

RUN apt update &&\
    apt upgrade -y &&\
    apt install -y wget unzip expect

ENV QBITTORRENT_HOME /qbittorrent

ENV PATH $QBITTORRENT_HOME:$PATH

ADD script/upgrade.sh /

ADD script/start.sh /

WORKDIR /root

RUN mkdir -p /opt/download &&\
    mkdir -p /qbittorrent &&\
    chmod 777 -R /opt/download/ &&\
    chmod 777 /start.sh &&\
    chmod 777 /upgrade.sh &&\
    echo umask 000 >> /etc/profile

RUN /upgrade.sh

RUN rm -rf /upgrade.sh

CMD ["expect", "/start.sh"]
