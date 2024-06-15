#! /bin/bash

last_version=$(wget -qO- -t1 -T2 "https://api.github.com/repos/c0re100/qBittorrent-Enhanced-Edition/releases/latest" | grep "tag_name" | head -n 1 | awk -F ":" '{print $2}' | sed 's/\"//g;s/,//g;s/ //g')

releases_status=$("curl -sIL -w "%{http_code}" -o /dev/null https://github.com/c0re100/qBittorrent-Enhanced-Edition/releases/download/$last_version/qbittorrent-enhanced-nox_x86_64-linux-musl_static.zip")

if [ -f "qbittorrent-nox_version" ];then
    version=$(cat qbittorrent-nox_version)
    if [ "$version" != "$last_version" ];then
        echo $last_version > qbittorrent-nox_version
        echo 'true'
    fi
elif [ "$releases_status" == "200" ];then
    echo $last_version > qbittorrent-nox_version
    echo 'true'
else
    echo 'false'
fi
