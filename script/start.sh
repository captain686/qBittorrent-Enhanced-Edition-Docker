#!/bin/expect

spawn qbittorrent-nox

expect "*Press 'y' key*"

send "y\r"

interact
