# 基础

## 数据类型

1. byte
2. boolean
3. short
4. char
5. int
6. float
7. long
8. double

## 容器

### HashMap

链表散列，通过key的hashCode得到的hash值，相同就覆盖，不同就拉链表解决冲突
阈值一般8，数据长度一般64
不是线程安全的

解决
1. 重写hashmap
2. 包装继承hashmap，生成子类
