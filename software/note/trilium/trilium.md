# trilium

## 安装

### web端

#### 服务器

##### docker包

###### 拉取image卷
```bash
docker pull zadam/trilium:[VERSION]
```
###### 运行image卷
```bash
sudo docker run -t -i -p 127.0.0.1:8080:8080 -v ~/trilium-data:/root/trilium-data zadam/trilium:latest
```

#### 客户端

### 安装器
不做介绍