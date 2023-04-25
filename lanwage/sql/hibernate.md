# hibernate

Hibernate查询语言为HQL（Hibernate Query Language），可以直接使用实体类名及属性。HQL语法类似于SQL，有SQL的关键词如select、from、order by、count()、where等等。不同的是HQL是一种完全面向对象的语言，能够直接查询实体类及属性。

Hibernate将HQL查询方式立为官方推荐的标准查询方式，HQL查询在涵盖Criteria查询的所有功能的前提下，提供了类似标准SQL语句的查询方式，同时也提供了更
加面向对象的封装。完整的HQL语句形势如下：
Select/update/delete…… from …… where …… group by …… having …… order by …… asc/desc
其中的update/delete为Hibernate3中所新添加的功能，可见HQL查询非常类似于标准SQL查询。

1. HQL语法
HQL语法类似于SQL，是一种select...from...的结构。其中，from后跟的是实体类名，而不是表名。select后面跟的可以是实体对象，也可以使实体对象的属性或者其他值，例如：
Query query = session.createQuery(" select * from Users as users ");// 查询所有的Users
List list = query.list(); // 执行查询，返回List
其中，Users为实体类Users，users为Users对象，关键词as用法同SQL，可以省略。Query是Hibernate的查询对象，query.list()将以List类型返回查询结果。上述查询也可以简写为：
Query query = session.createQuery(" from Users "); // 查询所有的Users
List list = query.list(); // 执行查询，返回List

2 HQL中的大小写
HQL语言大小写不敏感，“select * from Users as users”也可写作“SELECT * FROM Users as users”。但是涉及到Java类名、package名、属性名时，需要区分大小写，因此Users必须与类名一致。

3 查询中使用包名
一个工程中，如果不存在相同的实体类名，查询语句中实体类所在的package可省略。Hibernate会能够根据类名检索到实际的t实体类。但如果有相同的实体类名，查询时必须携带package信息，否则Hibernate不知道使用哪一个实体类。使用包名的查询语句实例代码如下：
SELECT users FROM com..java.vo.Users users
4 查询结果的返回类型
Hibernate使用Query对象进行查询。Session的createQuery方法能够创建Query实例，参数为HQL。Query对象能够返回各种类型的查询结果，例如long、String、List<</font>实体类名>、List、POJO等。最常用的查询方法有uniqueResult()与list()等。其中uniqueResult()返回单个值，而list()返回零个或者多个值。下面分别介绍uniqueResult()与list()。
（1）. uniqueResult()返回单个值
Query的unique()返回单个的对象。使用unique()获取返回值时，HQL语句查询到的结果最多只能有一个，如果结果多于一个，unique()方法会抛出异常。如果没有，会返回null。这个方法常常用来查询记录总数，因为总会返回一个对象，并且也只有一个。例如：
Query q = session.createQuery(" select count(*) from Users "); // 创建查询对象
Number num = (Number)q.uniqueResult(); // 返回单个实例
int count = num.intValue(); // 返回数值
查询总数时，HQL格式必须为“select count(*) from Users”的格式。返回值可能为Short、Integer、Long、BigInteger等各种类型，具体返回类型根据主键的类型而定。这里可以用所有数值类型的父类Number类型。

（2）. list()返回集合
Query的list()方法是最常用的方法。实际上，unique()方法也是在list()方法得到返回数据后执行的。list()总是返回一个java.util.List对象，里面有零个或者多个值。list()可以返回实体对象，也可以返回实体对象的某属性或者某些属性。例如：
List<</span>Users> list1 = session.createQuery(" select * from Users ").list();
List list2 = session.createQuery(" select users.name from Users users ").list();
List nlist3 = session.createQuery(" select users.name, users.dept.name from Users users ").list();
List<</span>Users>list4 = session.createQuery(" select users.dept from Users users ").list();
第一个查询返回存储着Users对象的List。第二个查询返回存储着Users的name值（String类型）的List。第三个查询返回存储着由Users的name值、Users对应的Dept的name值组成的字符串数组（String[]类型）的List。第四个查询返回存储着Users对应的Dept的List，虽然是Users的一个属性，但仍然是Users类型。

 5. 查询结果同时返回多个对象
Query的list()方法返回java.util.List对象。List中一般存储完整的实体类对象。例如“select * from Users”，会将所有的Users都查询出来，包含Users类的所有即时加载的属性。
对于有些查询，只需要查询几个属性就够了，而不需要查询所有的实体类属性。这时候可以在HQL中指定要返回的部分。查询部分属性时，返回结果仍然是List类型，里面可能是单个的对象Object，也可能是对象数组Object[]，还可能是List对象与Map对象。返回什么样的类型数据，由HQL语句决定。

6.返回List集合
返回结果还可以放到List中。查询时HQL采用“select new List(name1, name2, name3) from...”的形式。同样需要遍历List来获取返回的List，再遍历返回的List获取查询结果，实例代码如下：
// 查询三个字段，放入一个新的List集合中，再返回List集合对象list1
List list1 = session.createQuery(
" select new List(u.name, u.address,u.password) from Users u").list();
for (List li : list1) { // 遍历第一层List集合
for (Object o : li) { // 遍历第二层List集合（保存3个字段的集合）
System.out.println("" + o); // 输出对象Object
}
}
上述的代码中，在查询语句中把查询的字段放入List集合中，再把createQuery（）查询的结果放入到List集合中。通过for循环两次遍历，把集合中的对象遍历出来。



7.返回对象数组Object[]
查询多个属性时，Hibernate将同时返回多个对象（以Object[]类型返回）。返回的数组是放到List中的，得到返回的数组需要遍历List对象，示例代码如下：
List list = session.createQuery(
" select u.name, u.address,u.password from Users u ").list(); // 查询Users中的多个属性值，返回list
for (Object[] obj : list) { // 遍历装有数组的list集合
for (Object object : obj) { // 遍历数组
System.out.println("" + obj); // 输出遍历结果Object
}
}
上述代码查询多个属性，返回的是数组，如果只查询一个属性，则不会返回数组，而直接返回该类型数据。例如“select u.name from Users u”，将返回List。



8.返回实体类对象
这里说的实体类对象是指Java的实体类对象。如果只查询部分属性，返回数组、List、Map时很方便，但是操作Object[]数组、List、Map等不如操作实体对象方便。所以实际上查询部分属性时，可以返回实体对象。HQL中也可以使用构造函数。示例代码如下：
List<</span>Users> list = session.createQuery(
“ select newUsers(u.name, u.password) from Users u ”) .list(); // HQL中使用Users类的构造函数
HQL中使用Users类的构造函数时，Users类中必须存在一个public Users(String name, String password)的构造函数。因为Hibernate是通过调用该构造函数完成返回值从Object[]数组转化到Users实体类的。
说明：HQL中使用构造函数时，对应的实体类中也必须有同样参数特征的构造函数。

 9.返回Map集合
更实用的是返回Map类型。Map中将包含查询的列名、值。遍历List获得Map，从Map中直接取值就可以了，或者遍历Map，例如：
// 把需要查询的字段放到Map集合中，把查询的Map集合再返回List集合
List map = session.createQuery(
" select new Map(u.name as name, u.address as address, u.password as password) "
+ " from Users u ").list();
for (Map map1 : (List) map) { // 遍历List集合
System.out.println("Name: " + map1.get("name")); // 输出Map集合中的name属性
System.out.println("Password: " + map1.get("password")); // 输出Ma集合中的password属性
System.out.println("Address: " + map1.get("address")); // 输出Map集合address属性
}



10.条件查询
HQL用where连接条件子句，语法类似于SQL。大部分SQL的规则对于HQL都适用，例如等于（=）、大于（>）、小于（<</font>）等。HQL的where子句中使用的是实体类的属性，或者是属性的属性。查询条件可以写在HQL中，也可以通过Query设置参数，示例代码如下：
session.createQuery(" select * from Users "
+ " where u.dept.name = null and u.age < :age ")
.setParameter("age", 23).list();
HQL的where子句中可以使用的运算符如下：
q 数学运算符：+、-、*、/。
q 比较操作符：=、!=、<>、>=、<=、like。
q 逻辑计算法：and、or、not。
q SQL操作符：in、not in、between、is null、is not null、is empty、number of等。
q 字符串连接：...||...或者concat(..., ...)。
q 时间日期函数：current_date()、current_time()、current_timestamp()。
q 时间日期函数：second(...)、minute(...)、hour(...)、day(...)、month(...)、year(...)。
q JPA定义的操作：substring()、trim()、lower()、upper()、length()、locate()、abs()、sqrt()、bit_length()、coalesce()、nullif()。
q 数据库支持的SQL标量函数：sign()、trunc()、rtrim()、sin()。
q 简单的跳转语句：case ... when ... then ... else ... end。
例如字符串连接：
List list = session.createQuery(
" select u.name || '所在部门为' || u.dept.name from Users u where u.dept != null ").list();
in子句查询：
List<</span>Users> list = session.createQuery(“ from Users where lower(trim(uu.name)) in (‘Jack’, ‘Macle’, ‘李四’) ”).list();
集合查询：
List<</span>Users> list = session.createQuery(“ from Users u where size(u.events) > 5 ”).list();
设置查询条件时，应尽量使用setParameter()传递参数，而不是将参数写进HQL语句。第一次执行SQL语句时，数据库会将该SQL语句进行编译，供下次查询使用。对于参数不同的相同查询，数据库将直接调用编译后的SQL，提高查询效率。



11.HQL中的统计函数
跟SQL一样，Hibernate也提供一系列的统计函数。Hibernate会把HQL的统计函数转化为底层数据库SQL支持的函数。
SQL里的常用统计函数比如count()、sum()、min()、max()、avg()、count(distinct ...)等也都能用在HQL里，语法与SQL一样，例如：
Number num = (Number) session.createQuery(
" select count(*) from Users u where u.name != null ")
.uniqueResult();
int count = num.intValue();
查询总数时并不总是返回Long类型。返回值类型由实体类的主键类型决定的。如果实体类的主键为short类型，则返回值可能为Integer类型。


12.HQL分页显示查询结果
分页显示是web数据库程序必备的功能。不同的数据库使用不同的方式实现分页，例如MySQL使用limit，Oracle使用rownum。Hibernate隐藏了所有的细节，只需要设置当前页数即可。
分页显示一般先查询记录总数，然后查询本页显示的记录。Hibernate通过Query查询记录，Query通过setFirstResult()设置分页的第一条记录，通过setMaxResults()设置取本页的数据数，示例代码如下：
//HQL的分页查询
Query q2 = session.createQuery("from Employees");//查询所有记录
int page=1; //设置默认的页数为1
q2.setFirstResult((page-1)*2); //每页起始数
q2.setMaxResults(5); //每页最最多显示的页数
List emps = q2.list();//返回list集合
for (Employees emp:emps) {
System.out.println(emp.getEmployeeId());//打印输出属性
}
分页显示一般会封装成Pagination组件。Pagination负责计算每页的起始记录、总页数等。使用实例见Servlet章节。
查询总数时并不总是返回Long类型。返回值类型由实体类的主键类型决定的。如果实体类的主键为short类型，则返回值可能为Integer类型。

13.HQL跨表查询
对于一般的跨表查询，表连接就足够了。Hibernate支持用“.”作为操作符获取属性，用法类似于JSP中的EL表达式。表连接查询适用于非集合属性，对于一般的跨表查询，只需要简单的使用属性就可以了。例如Users的name属性，Dept的name属性等，示例代码如下：
List<</span>Users> list = session.createQuery(
" select * from Users u where u.dept.name = 'Java开发部' ").list();
表面上该查询只涉及Users表，但实际上因为where子句条件用到了u.dept.name，将会查询Dept表与Users表。



14.HQL级联查询
有些查询需要使用级联查询。HQL支持SQL的级联查询，包括inner join、left join、right join、full join等。级联查询适用于集合属性，例如Users的dept集合属性。例如查询events集合属性中有“迟到”事件的cat，查询语句为：
List<</span>Users> list = session.createQuery(
" select * from Users u left join u.events e where e.description like :description ")
.setParameter("description", "%迟到%").list();



15.使用数据库SQL
HQL可以看作是是对所有数据库SQL的封装。HQL提供的功能是底层数据库SQL支持的，HQL只是将功能“翻译”成了底层SQL的功能。有些情况下，底层数据库会提供某种功能，但是可能HQL不支持。这时可以使用底层SQL，在专业术语上叫做本地SQL（Native SQL）。
使用数据库SQL查询时不能使用Query，要使用SQLQuery对象。例如在MySQL数据库中查询所有的变量：
SQLQuery sqlQuery = session.createSQLQuery(" show variables "); // 使用本地SQL查询所有的变量
List list = sqlQuery.list(); // 执行查询,把查询结果放到List集合中
for (Object[] object : list) { // 遍历集合中所有的属性
System.out.println(object [0] + ", " + object [1] + ", "); // 输出对象属性值
}
SQLQuery与Query一样，都也可以设置参数、分页显示等。SQLQuery返回的结果为List类型。也可以设置为实体类，使查询结果直接返回实体类对象，示例代码如下：
SQLQuery sqlQuery = session.createSQLQuery(" select * from users"); // 使用本地SQL查询
sqlQuery.addEntity(Users.class); // 设置输出类型括号中是实体类名
List< Users > list = sqlQuery.list(); // 返回List< Users >
如果设置的实体类与查询结果不一致，会抛出异常。



16.使用@注解配置命名查询
有些查询是常用的，Hibernate中可以把常用的查询命名，需要使用查询时只需要引用名称就可以了。命名查询一般配置在实体类中。有使用@注解配置命名查询和使用XML配置命名查询。
使用@注解配置实体类时，要使用@注解配置命名查询，用到的Java注解为@NamedQuery与@NamedNativeQuery。其中，@NamedQuery用于配置命名的HQL查询，@NamedNativeQuery用于配置命名的底层数据库SQL查询，实体类中的代码如下：
import javax.persistence.*;
@NamedQuery(name = "all users", query = " select * from Users")// 命名查询，name是查询语句的名称
@NamedNativeQuery(name = "all users", query = "select * from users") // 命名本地查询
@Entity // Entity配置
@Table(name = "users") // Table配置
public class Users {
//这里省略了类中的内容
}
上述代码中，命名查询的查询语句中Users是实体类的名称，命名本地查询的查询语句中users是数据库表名。



17.使用@QueryHint扩展查询
命名查询中，允许使用@QueryHint对命名查询设置JPA扩展。JPA规范允许对JPA进行一些功能上的扩展，以加速查询性能、提供其他功能等。示例代码如下：
@NamedQuery(name = "all users name", query = " select * from Users u where u.name = :name ", hints = { @QueryHint(name = "org.hibernate.callable", value = "true") })
使用@QueryHint时，要把@QueryHint写在hints中，hints的格式是“hints={}”，需要写的@QueryHint内容写在大括号中。org.hibernate.callable 的布尔变量值表明这个查询是否是一个存储过程。value=”true”表示这个查询是存储过程。



18.同时设置多个命名查询
一个实体类不能配置多个@NamedQuery。如果有多个命名查询，需要使用@NamedQueries配置。@NamedQueries中可以配置多个@NamedQuery，示例代码如下：
@NamedQueries(value = {
@NamedQuery(name = "all users", query = " select u from Users u "),
@NamedQuery(name=" users name", query=" select u from Users u where u.name = :name ",),
@NamedQuery(name=" users for dept",query="select u from Users u where u.dept.name = :dept ") })
当需要使用到命名查询的时候，直接在程序中调用，程序中这样使用命名查询，如果有参数，需要设置参数，示例代码如下：
Query query = session.getNamedQuery("users name ").setParameter(“name”, “Jack”);
List<</span>Users> list = query.list();