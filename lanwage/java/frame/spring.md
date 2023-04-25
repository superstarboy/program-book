# spring

## 注解

标记需要注册到容器的java类
- Component
- Repository
- Service
- Controller


## 事务

特点
1. 原子性
2. 一致性
3. 隔离性
4. 持久性

传播机制

| 名称 | 功能 |
| ---- | ---- |
| propagation_required | 默认，外层有事务，当前加入外层，一起提交回滚 |
| propagation_reques_new | 开启事务后会吧外层事务挂起 |
| propagation_not_supoort | 不支持事务 |


## IoC容器

### IoC原理

### 装配Bean

### 使用Annotation配置

### 定制Bean

### 使用Resource

### 注入配置

### 使用条件装配


## 使用AOP

### 装配AOP

### 使用注解装配AOP

### AOP避坑指南

## 访问数据库

### 使用JDBC

### 使用声明式事务

### 使用DAO

### 集成Hibernate

### 集成JPA

### 集成MyBatis

### 设计ORM

## 开发Web应用

### 使用Spring MVC

### 使用REST

### 集成Filter

### 使用Interceptor

### 处理CORS

### 国际化

### 异步处理

### 使用WebSocket


## 集成第三方组件

### 集成JavaMail

### 集成JMS

### 使用Scheduler

### 集成JMX
