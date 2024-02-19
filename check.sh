#! /bin/bash

last_version=$(wget -qO- -t1 -T2 "https://api.github.com/repos/c0re100/qBittorrent-Enhanced-Edition/releases/latest" | grep "tag_name" | head -n 1 | awk -F ":" '{print $2}' | sed 's/\"//g;s/,//g;s/ //g')

if [ -f "qbittorrent-nox_version" ];then
    version=$(cat qbittorrent-nox_version)
    if [ "$version" != "$last_version" ];then
        echo $last_version > qbittorrent-nox_version
        echo 'true'
    fi
else
    echo $last_version > qbittorrent-nox_version
    echo 'true'
fi
