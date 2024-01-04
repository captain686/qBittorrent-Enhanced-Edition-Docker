#! /bin/bash


last_version=$(wget -qO- -t1 -T2 "https://api.github.com/repos/c0re100/qBittorrent-Enhanced-Edition/releases/latest" | grep "tag_name" | head -n 1 | awk -F ":" '{print $2}' | sed 's/\"//g;s/,//g;s/ //g')

upgrade(){
#    last_version=$(wget -qO- -t1 -T2 "https://api.github.com/repos/c0re100/qBittorrent-Enhanced-Edition/releases/latest" | grep "tag_name" | head -n 1 | awk -F ":" '{print $2}' | sed 's/\"//g;s/,//g;s/ //g')

    wget "https://github.com/c0re100/qBittorrent-Enhanced-Edition/releases/download/$1/qbittorrent-enhanced-nox_x86_64-linux-musl_static.zip"

    unzip -o qbittorrent-enhanced-nox_x86_64-linux-musl_static.zip -d /qbittorrent

    rm -rf qbittorrent-enhanced-nox_x86_64-linux-musl_static.zip
}

upgrade $last_version

# if [ -f "/qbittorrent/qbittorrent-nox" ];then
#    version=$(qbittorrent-nox -v | awk '{print $2}')
#    if [ $version -ne $last_version ];then
#        upgrade $last_version
#    fi
#else
#    echo 'Install qBittorrent ... '
#    upgrade $last_version
#fi

chmod 777 /qbittorrent/qbittorrent-nox
