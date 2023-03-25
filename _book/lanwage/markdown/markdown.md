# markdown语法

## 二级标题

### 三级标题

---

## 字体

```
**加粗**
```
**加粗**

```
*倾斜*’
```
*倾斜*’
```
***倾斜加粗***

```
***倾斜加粗***

```
~~加删除线~~
```
~~加删除线~~

---
## 引用

```
> 引用
>> 引用
>>>> 引用
```
> 引用

>> 引用

>>>> 引用

---

#### 分割线

``` bash
---
***
```

---

***

## 图片

```
![图片alt](图片地址 ''图片title'')
```
![blockchain](https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=702257389,1274025419&fm=27&gp=0.jpg "区块链")

---

```
[超链接名](超链接地址 "超链接title")
```

[百度](https://baaidu.com)

---

## 列表

```
- 别表内容
+ 列表内容
* 列表内容
```

- 别表内容
+ 列表内容
* 列表内容


```
1. 一级列表
2. 二级列表
```

1. 一级列表
2. 二级列表

---

## 代码

```
(```)
代码内容
(```)
```

```
代码内容
```

---

## 折叠
<details>
    <summary>折叠标题</summary>

    折叠内容
</details>

## 红色字体
<font color="red" size=3></font>

## 流程图

```
    ```flow
    st=>start: 开始
    op=>operation: 我的操作
    cond=>condition: Y or N?
    e=>end
    st->op->cond
    cond(Y)->e
    cond(N)->op
    ```
```

```flow
st=>start: 开始
op=>operation: 我的操作
cond=>condition: Y or N?
e=>end
st->op->cond
cond(Y)->e
cond(N)->op
```