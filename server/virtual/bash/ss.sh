#!/bin/bash

yum install -y python-setuptools && easy_install pip
yum install -y vim
pip3.6 install shadowsocks

# 配置定义
port="8888"
method="aes-256-cfb"
password="654321"
file="/etc/shadowsocks.json"

myip=`curl ifconfig.me`
echo $myip

echo "{" > $file
echo "\"server\":\"${myip}\"," >> $file
echo "\"server_port\":${port}," >> $file
echo "\"local_port\":1080," >> $file
echo "\"password\":\"${password}\"," >> $file
echo "\"timeout\":600," >> $file
echo "\"method\":\"${method}\"" >> $file
echo "}" >> $file

/sbin/iptables -I INPUT -p tcp --dport ${port} -j ACCEPT

ssserver -c ${file} -d start
