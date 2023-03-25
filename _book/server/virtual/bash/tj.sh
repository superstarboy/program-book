#!/bin/bash

yum install -y vim
systemctl start firewalld

firewall-cmd --zone=public --add-port=80/tcp --permanent
firewall-cmd --zone=public --add-port=443/tcp --permanent


yum install -y wget
wget -N --no-check-certificate -q -O trojan_install.sh "https://raw.githubusercontent.com/V2RaySSR/Trojan/master/trojan_install.sh" && chmod +x trojan_install.sh && bash trojan_install.sh

cat /usr/src/trojan-macos/trojan/config.json

{
    "run_type": "client",
    "local_addr": "127.0.0.1",
    "local_port": 1080,
    "remote_addr": "www.demo.com",
    "remote_port": 443,
    "password": [
        "ae412345"
    ],
    "log_level": 1,
    "ssl": {
        "verify": true,
        "verify_hostname": true,
        "cert": "",
        "cipher": "ECDHE-ECDSA-AES128-GCM-SHA256:...",
        "cipher_tls13": "TLS_AES_128_GCM_SHA256:...",
        "sni": "",
        "alpn": [
            "h2",
            "http/1.1"
        ],
        "reuse_session": true,
        "session_ticket": false,
        "curves": ""
    },
    "tcp": {
        "no_delay": true,
        "keep_alive": true,
        "reuse_port": false,
        "fast_open": false,
        "fast_open_qlen": 20
    }
}


配置：/usr/local/etc/trojan/配置.txt
命令
Trojan服务重启命令:systemctl restart trojan

你的Trojan配置信息为:
域名:www.xionglijie.tk
密码:8043d246
端口:443
若需修改密码或忘记密码
请访问VPS: /usr/local/etc/trojan/config.json
推荐Win客户端下载:https://www.v2rayssr.com/trojanwin.html
推荐安卓客户端软件:https://github.com/apache/ignite/releases
MacOS和IOS太高端，请自行选择 Trojan 客户端 

wget -N --no-check-certificate "https://raw.githubusercontent.com/V2RaySSR/Trojansh/master/trojan1.sh" && chmod +x trojan1.sh && ./trojan1.sh

wget -N --no-check-certificate "https://raw.githubusercontent.com/V2RaySSR/Trojansh/master/trojan2.sh" && chmod +x trojan2.sh && ./trojan2.sh

wget -N --no-check-certificate "https://raw.githubusercontent.com/V2RaySSR/Trojansh/master/trojan3.sh" && chmod +x trojan3.sh && ./trojan3.sh

wget -N --no-check-certificate "https://github.com/ylx2016/Linux-NetSpeed/releases/download/sh/tcp.sh" && chmod +x tcp.sh && ./tcp.sh


source <(curl -sL https://git.io/trojan-install)