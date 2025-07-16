#!/bin/bash

# Get the latest version tag from GitHub API
latest_tag=$(wget -qO- "https://api.github.com/repos/c0re100/qBittorrent-Enhanced-Edition/releases/latest" 2>/dev/null | grep '"tag_name"' | head -n1 | awk -F'"' '{print $4}')

# Define download URL
download_url="https://github.com/c0re100/qBittorrent-Enhanced-Edition/releases/download/${latest_tag}/qbittorrent-enhanced-nox_x86_64-linux-musl_static.zip"

# Check if the file exists on the server
http_code=$(curl -sIL -w "%{http_code}" "${download_url}" -o /dev/null)

# Read current version if file exists
current_version=""
if [ -f "qbittorrent-nox_version" ]; then
    current_version=$(cat qbittorrent-nox_version)
fi

# If download URL is valid and version differs, update version file and output 'true'
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
