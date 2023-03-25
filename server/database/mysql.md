# MYSQL

## 软件管理(linux下)

### 安装

```shell
yum install mysql-community-server
```

centos默认安装mariadb，会报No package mysql-server available错误
使用

```shell
sudo rpm -Uvh http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm
mysql： yum install mysql mysql-server mysql-libs mysql-server
```

下载

### 卸装

停止mysql服务、删除之前安装的mysql
删除命令：rpm -e –nodeps 包名
例：rpm -ev MySQL-client-5.5.25a-1.rhel5
如果提示依赖包错误，
则使用以下命令尝试
rpm -ev MySQL-client-5.5.25a-1.rhel5 --nodeps
如果提示错误：error: %preun(xxxxxx) scriptlet failed, exit status 1
则用以下命令尝试：

```shell
rpm -e --noscripts MySQL-client-5.5.25a-1.rhel5
```

### 查询状态

使用以下命令查看当前安装mysql情况

```shell
rpm -qa | grep -i mysql
```

查询版本需进入MySQL命令行

```mysql
status
select version()
```

查询所有账号

```mysql
select * from mysql.user
```

### 启动，运行

#### 启动

1. 使用 service 启动：

    ```shell
    [root@localhost /]# service mysqld start (5.0版本是mysqld)
    [root@szxdb etc]# service mysql start (5.5.7版本是mysql)
    ```

2. 使用 mysqld 脚本启动:

    ```shell
    /etc/inint.d/mysqld start
    ```

3. 使用 safe_mysqld 启动：

    ```shell
    safe_mysqld&
    ```

#### 停止

1. 使用 service 启动：

    ```shell
    service mysqld stop
    ```

2. 使用 mysqld 脚本启动：

    ```shell
    /etc/inint.d/mysqld stop
    ```

3. mysqladmin shutdown

#### 重启

1. 使用 service 启动：

    ```shell
    service mysqld restart
    service mysql restart (5.5.7版本命令)
    ```

2. 使用 mysqld 脚本启动：

    ```shell
    /etc/init.d/mysqld restart
    ```

### 远程

打开端口

```shell
/sbin/iptables -I INPUT -p tcp --dport 3306 -j ACCEPT
```

创建远程链接账号

```mysql
grant all privileges on *.* to admin@localhost identified by 'password' with grant option;
grant all privileges on *.* to admin@"%" identified by 'password' with grant option;
flush privileges;
```
