#!/bin/bash

# 安装docker

# ubuntu版本
# 卸装旧版本
sudo apt-get remove docker docker-engine docker.io containerd runc
# 更新库
sudo apt-get update
# 安装软件包
sudo apt-get install \
apt-transport-https \
ca-certificates \
curl \
gnupg-agent \
software-properties-common
# 添加docker的官方gpg密钥
curl -fsSL https://download.docker.com/linux/ubuntu/pgp | sudo apt-key add -
# 设定存储库
sudo add-apt-repository \
"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) \
stable"
# 安装
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

# 