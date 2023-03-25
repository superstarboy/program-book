# docker分包管理工具

## 安装相关

### 卸装旧版本

``` bash
    sudo yum remove docker \
        docker-client \
        docker-client-latest \
        docker-common \
        docker-latest \
        docker-latest-logrotate \
        docker-logrotate \
        docker-engine
```

### 安装

#### 准备

``` bash
    sudo yum update
    sudo yum install -y yum-utils \
    device-mapper-persistent-data \
    lvm2
```

#### 添加yum软件源

``` bash
    sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
```

#### 安装docker

``` bash
    sudo yum update
    sudo yum install docker-ce
```

将docker加入用户组命令

``` bash
    sudo usermod -aG docker USER_NAME
```

##### 安装指定版本

``` bash
    # 查询指定版本
    yum list docker-ce --showduplicates | sort -r
    # 安装
    sudo yum install docker-ce-<VERSION STRING>
```

### 启动

``` bash
    # 添加到开机启动
    sudo systemctl enable docker
    # 启动服务
    sudo systemctl start docker
```

### 验证安装

``` bash
    sudo docker version | info
```

### 更新和卸装

``` bash
    # 更新
    sudo yum update docker-ce
    # 卸装
    sudo yum remove docker-ce
    # 删除本地文件
    sudo rm -rf /var/lib/docker
```

## 管理

``` bash
# 查看所有容器
docker ps -a
# 查询所有镜像
docker images
# 删除容器
docker rm [{容器id}|$(docker ps -aq){所有容器}]
# 删除镜像
docker rmi [{镜像id}|$(docker images -q){所有镜像})]
# 进入docker容器
docker exec -it {容器id} /bin/bash
```

### 容器

``` bash
    # 列出本机正在运行的容器
    docker container ls
    # 列出本机所有容器
    docker container ls --all
    # 删除容器
    docker container rm [container ID]
```

### image卷

## 杂项

### 修改docker的仓库源地址

``` bash
    # 在/etc/default/docker文件后追加
    DOCKER_OPTS="--registry-mirror=https://registry.docker-cn.com"
    # 重启服务
    sudo service docker restart
```

## docker compose管理

### 安装

``` bash
# 下载
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
# 权限
sudo chmod +x /usr/local/bin/docker-compose
# 检测
docker-compose --version
```

### 运行

``` bash
docker-compose up -d # 守护方式启动
```

### 维护

``` bash
# 关闭
docker-compose stop
```

## 错误汇总

### Service 'php' failed to build: The command returned a non-zero code: 1

#### 解决方式
#### 错误原因
执行内容无响应,某些安装包已经不存在

### Cannot connect to the Docker daemon at unix:/var/run/docker.sock. Is the docker daemon running?

#### 解决方式
```bash
systemctl start docker
```

#### 原因
不知

### unit not found

#### 解决方式
重新更新docker包

#### 错误原因
缺少 rhel-push-plugin