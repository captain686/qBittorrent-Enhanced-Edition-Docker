#! /bin/expect

spawn qBittorrrent_upgrade

interact

spawn qbittorrent-nox

expect "*Press 'y' key*"

send "y\r"

interact
