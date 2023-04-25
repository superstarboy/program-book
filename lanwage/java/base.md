# 基础

## JVM
java的虚拟机

## JDK
java sdk，包含JRE所有的一切，外加编译器javac和工具javadoc和jdb

## JRE
java的运行时环境，是运行已编译java程序所需的所有内容的合集，包括JVM和java类库

## 关键字

|  |  |  |  |  |  |  |  |
| ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
| 访问控制 | private | protected | public |
|类，方法和变量修饰符 | abstract | class | extends | final | implements | interface | native |
| | new | static | strictfp | synchronized | transient | volatile |
| 程序控制 | break | continue | return | do | while | if | else |
| | for | instanceof | switch | case | default |	
| 错误处理 | try | catch | throw | throws | finally |
| 包相关 |	import | package |
| 基本类型 | boolean | byte | char | double | float | int |	long
| short | null | true | false |			
| 变量引用 | super | this |	void |				
| 保留字 | goto | const |


## 调试工具
Spring Boot Actuator、Spring Shell、Spring Insight

## 数据类型

1. 整数类型
   1. byte
   2. short
   3. int
   4. long
2. 浮点数类型
   1. float
   2. double
3. 字符类型
   1. char
4. 布尔类型
   1. boolean

### 引用类型

1. class
2. interface

### 常量

final

## 核心类

1. 字符串和编码
2. StringBuilder
3. StringJoiner
4. 包装类型
5. JavaBean
6. 枚举类
   1. enum
7. 记录类
8. BigInteger
9. BigDecimal
10. 常用工具类
    1. Math
    2. StrictMath
        1.  两个类的区别在于，由于浮点数计算存在误差，不同的平台（例如x86和ARM）计算的结果可能不一致（指误差不同），因此，StrictMath保证所有平台计算结果都是完全相同的，而Math会尽量针对平台优化计算速度，所以，绝大多数情况下，使用Math就足够了。
    3. HexFormat
       1. 对字符进制进行转化
    4. Random
       1. 伪随机数
    5. SecureRandom
       1. 真随机数

## 注解
注解是放在Java源码的类、方法、字段、参数前的一种特殊“注释，注释会被编译器直接忽略，注解则可以被编译器打包进入class文件，因此，注解是一种用作标注的“元数据”。

### 类型

1. 由编译器使用的注解，这类注解不会被编译进入.class文件，它们在编译后就被编译器扔掉了。
   1. @Override：让编译器检查该方法是否正确地实现了覆写；
   2. @SuppressWarnings：告诉编译器忽略此处代码产生的警告。
2. 由工具处理.class文件使用的注解，比如有些工具会在加载class的时候，对class做动态修改，实现一些特殊的功能。
   1. 这类注解会被编译进入.class文件，但加载结束后并不会存在于内存中。这类注解只被一些底层库使用，一般我们不必自己处理。
3. 在程序运行期能够读取的注解，它们在加载后一直存在于JVM中，这也是最常用的注解。
   1. 例如，一个配置了@PostConstruct的方法会在调用构造方法后自动被调用（这是Java代码读取该注解实现的功能，JVM并不会识别该注解）。

定义一个注解时，还可以定义配置参数。配置参数可以包括：

1. 所有基本类型；
2. String；
3. 枚举类型；
4. 基本类型、String、Class以及枚举的数组。

因为配置参数必须是常量，所以，上述限制保证了注解在定义时就已经确定了每个参数的值。

注解的配置参数可以有默认值，缺少某个配置参数时将使用默认值。

此外，大部分注解会有一个名为value的配置参数，对此参数赋值，可以只写常量，相当于省略了value参数。

如果只写注解，相当于全部使用默认值。

### 使用注解

### 定义注解

### 处理注解

## 反射

## 泛型

## 集合

## IO

## 日期与时间

## 单元测试

## 正则表达式

## 加密安全

## 多线程

## Maven基础

## 网络编程

## XML与JSON

## JDBC编程

## 函数式编程

## 设计模式

## 容器

### HashMap

链表散列，通过key的hashCode得到的hash值，相同就覆盖，不同就拉链表解决冲突
阈值一般8，数据长度一般64
不是线程安全的

解决
1. 重写hashmap
2. 包装继承hashmap，生成子类
