#!/bin/expect

spawn /upgrade.sh

interact

spawn qbittorrent-nox

expect "*Press 'y' key*"

send "y\r"

interact
