# dingo/api

## 配置

### API_STANDARDS_TREE

- - - - - - - - - - - -

standards tree 标准树

- 未注册私有 x
- 私有 prs
- 供应商 vnd

### API_SUBTYPE

- - - - - - - - - - - -

请求的header中需要用到的私有标记名

### API_PREFIX | API_DOMAIN

- - - - - - - - - - - -

地址前缀 | 子域
> 2选1

### API_VERSION

- - - - - - - - - - - -

当前版本

### API_NAME

- - - - - - - - - - - -

生成的文档名称

### API_CONDITIONAL_REQUEST

- - - - - - - - - - - -

条件请求开启状态：是否开启缓存

### API_STRICT

- - - - - - - - - - - -

严格模式，请求头必须包含正确格式的accept

### API_DEBUG

- - - - - - - - - - - -

调试模式

### API_DEFAULT_FORMAT

- - - - - - - - - - - -

返回的类型

## 测试

### 请求头格式

- - - - - - - - - - - -

``` php
    Accept: application/vnd[树类型].mymall[私有标记名].v1[版本号]+json
```
