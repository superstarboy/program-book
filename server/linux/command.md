# 命令行

## 用户管理

### 新增用户组

```bash
useradd {-g $username="用户数组名称"} $name="用户数组名称"
```

### 添加到目标用户组

``` bash
sudo usermod -aG docker {用户组名称}
```

## 权限

## 文件相关

### 设置win文件为linux可读文件,用vim打开
``` bash
:set ff=unix
```