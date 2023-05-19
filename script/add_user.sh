#! /bin/bash

uid=$(cat /etc/passwd | grep nobody | awk '{print $1}' | tr ":" " " | awk '{print $3}')
sed -i "/nobody/d" /etc/passwd
sed -i "/$uid/d" /etc/passwd
echo "nobody:x:$uid:$uid:Kernel Overflow User:/home/nobody:/bin/bash" >> /etc/passwd
sed -i "/nobody/d" /etc/group
sed -i "/$uid/d" /etc/group
echo "nobody:x:$uid:" >> /etc/group

usermod -a -G nobody nobody
