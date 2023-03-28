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
