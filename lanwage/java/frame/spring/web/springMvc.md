# 使用Spring MVC

## 目录结构

```
project
  |-- pom.xml
  `-- src
      |-- main
      |   |-- java            # 主要实现代码目录
      |   |-- resources       # 资源文件目录（如配置文件）
      |   |-- webapp          # web应用文件目录，存放WEB-INF, jsp等文件 (仅针对Web项目)
      |   `-- <environment>   # 配置相关的环境目录（如开发环境dev、测试环境test、生产环境prod等）
      `-- test
          |-- java            # 测试代码目录
          `-- resources       # 测试相关资源文件目录
```

## 关键配置文件
- pom.xml
- web.xml
- springmvc-servlet.xml
- DispatcherServlet

```xml
<!-- 配置DispatcherServlet，映射所有的请求 -->
<servlet>
    <servlet-name>dispatcherServlet</servlet-name>
    <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
    <init-param>
        <!-- 指定Spring MVC配置文件的位置 -->
        <param-name>contextConfigLocation</param-name>
        <param-value>/WEB-INF/spring-mvc-config.xml</param-value>
    </init-param>
    <load-on-startup>1</load-on-startup>
</servlet>

<!-- DispatcherServlet映射规则 -->
<servlet-mapping>
    <servlet-name>dispatcherServlet</servlet-name>
    <url-pattern>/</url-pattern>
</servlet-mapping>

```

- spring上下文配置

```xml
<!-- Spring上下文的配置 -->
<context-param>
    <param-name>contextConfigLocation</param-name>
    <param-value>/WEB-INF/applicationContext.xml</param-value>
</context-param>

<listener>
    <listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>
</listener>

```

- 编码过滤器

```xml
<!-- 字符编码过滤器配置 -->
<filter>
    <filter-name>encodingFilter</filter-name>
    <filter-class>org.springframework.web.filter.CharacterEncodingFilter</filter-class>
    <async-supported>true</async-supported>
    <init-param>
        <param-name>encoding</param-name>
        <param-value>UTF-8</param-value>
    </init-param>
    <init-param>
        <param-name>forceEncoding</param-name>
        <param-value>true</param-value>
    </init-param>
</filter>
<filter-mapping>
    <filter-name>encodingFilter</filter-name>
    <url-pattern>/*</url-pattern>
</filter-mapping>

```

## 理解模块关系
- controller
- service
- DAO

Controller 是 Web 层的组件，负责接收用户请求并调用相应的 Service 进行业务处理。Service 层负责封装业务逻辑，通常用于处理业务复杂度较高的情况，主要包括数据持久化操作、事务处理、数据校验、权限控制等。而 DAO（Data Access Object）层则是与数据访问相关的组件，它主要负责对数据库进行 CRUD 操作。

Controller 、Service 和 DAO 三个组件之间的关系如下：

Controller 调用 Service 层进行数据逻辑处理：Controller 接收并解析用户请求，然后调用相应的 Service 方法进行逻辑业务处理，最终将结果返回给客户端。

Service 层调用 DAO 层进行数据库操作：Service 层需要进行数据库操作时，会调用相应的 DAO 方法完成数据访问操作。

DAO 层完成数据持久化操作：DAO 层负责实现 CRUD （增删改查）操作，并与数据库进行交互，从而完成数据持久化工作。

通过以上分层，可以提高代码的可读性、可维护性和可扩展性，使得开发人员更加专注于不同的业务领域，并便于团队开发。同时，SpringMVC 还提供了很多 IOC 和 AOP 等技术支持，可以方便地管理和配置各个组件，使得代码更加简洁和结构清晰。



## 事物管理器类

SpringMVC 中使用 @Transactional 注解来控制事务，但在某些特殊的情况下，可能需要自定义事务管理器以满足特定的需求。Tr1121.java 文件就是一个自定义的事务管理器实现类，在其中可以编写一些与事务相关的处理逻辑。

如果您正在开发 SpringMVC 应用，并且需要自定义事务管理器，可以参考 Tr1121.java 的代码实现，了解如何配置和使用自定义的事务管理器。

常用的事务管理器类文件有以下几种：

HibernateTransactionManager：用于控制 Hibernate 框架的事务行为。当应用中使用 Hibernate 作为持久化框架时，通常使用该事务管理器类来开启和控制事务。

DataSourceTransactionManager：用于控制 JDBC 数据源的事务行为。当应用中使用传统的 JDBC 技术与数据库交互时，可以使用该事务管理器类进行事务管理。

JtaTransactionManager：用于控制分布式事务的行为。当应用中需要跨越多个数据源或者多个系统进行事务操作时，可以采用分布式事务解决方案，并使用该事务管理器类进行控制。

自定义事务管理器：SpringMVC 还提供了自定义事务管理器的接口和模板类，可以根据具体需求实现自己的事务管理器。

无论使用哪种事务管理器，都需要在 SpringMVC 应用中将其配置到对应的类中，并使用 @Transactional 注解等方式来标注需要开启事务的方法。这样，就能够在应用中实现对事务的管理并保证数据完整性和一致性
