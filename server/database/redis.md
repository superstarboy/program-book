# redis

## 1. 配置

redis 没有账号概念，没有即没有用户名与账号管理

### 1. 配置密码

``` json
    requirepass [密码]
```

### 2. 远程访问控制

``` json
    bind 127.0.0.1 :: 1 // 绑定到本地服务，不允许远程连接
```

### 3. 安全模式

``` json
    protected-mode yes | no
```

## 2. 基本命令行

### 1. 启动，停止，重启

``` php
    /etc/init.d/redis-server start | stop | restart
```
