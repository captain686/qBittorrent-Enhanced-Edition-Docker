#!/bin/bash

# 获取最新版本信息
release_json=$(wget -qO- "https://api.github.com/repos/c0re100/qBittorrent-Enhanced-Edition/releases/latest" 2>/dev/null)

# 提取版本号和下载地址
latest_tag=$(echo "$release_json" | grep '"tag_name":' | cut -d '"' -f4)
download_url=$(echo "$release_json" | grep 'qbittorrent-enhanced-nox_x86_64-linux-musl_static.zip' -A1 | grep browser_download_url | cut -d '"' -f4)

# 检查下载链接是否有效
http_code=$(curl -sIL -w "%{http_code}" "${download_url}" -o /dev/null)

# 读取当前已下载版本
current_version=""
if [ -f "qbittorrent-nox_version" ]; then
    current_version=$(cat qbittorrent-nox_version)
fi

# 如果链接有效，且版本不同，则更新版本号并返回 true
if [ "${http_code}" = "200" ]; then
    if [ "${current_version}" != "${latest_tag}" ]; then
        echo "${latest_tag}" > qbittorrent-nox_version
        echo 'true'
    else
        echo 'false'
    fi
else
    echo 'false'
fi
