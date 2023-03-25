# artisan命令

- - - - - - - - - - - - -

## 1. help 帮助命令

显示指定命令的使用方法和详细信息
> php artisan help OR -h OR --help [命令名称]

## 2. 常规命令列表

- 抑制输出信息

    ``` php
        php artisan --quiet OR -q
    ```

- 打印版本信息

    ``` php
        php artisan --version OR -V
    ```

- 强制输出ANSI格式

    ``` php
        php artisan --ansi
    ```

- 不询问任何交互性问题

    ``` php
        php artisan --no-interaction OR -n
    ```

- 禁止输出ANSI格式

    ``` php
        php artisan --no-ansi
    ```

- 通过v数量控制命令行输出内容，1：正常；2：更多；3：调试

    ``` php
        php artisan -v OR -vv OR -vvv
    ```

- 移除编译优化过的文件

    ``` php
        php artisan clear-compiled
    ```

- 显示所有可用命令

    ``` php
        php artisan list
    ```

- 代码中调用artisan命令

    ``` php
        $common = Artisan::call('help');
    ```

## 3. 生成类命令

- 生成新的处理器类

    ``` php
        php artisan handler:command [--command="..."] // 需要处理器处理的命令类名字
         name
    ```

- 基于注册信息，生成遗漏的events和handlers

    ``` php
        php artisan event:generate
    ```

- 创建新的时间处理器类

    ``` php
        php artisan handler:event
        [--event="..."] // 需要处理器处理的事件类名字
        [--queued] // 需要处理器使用队列话处理的事件类名字
        name
    ```

- 生成应用的key（会覆盖）

    ``` php
        php artisan key:generate
    ```

- 创建一个新的资源控制器

    ``` php
        php artisan make:controller
        [--plain] // 生成一个空白的控制器类
        name
        OR
        App\\Admin\\Http\\Controllers\\TestController
    ```

- 创建中间件

    ``` php
        php artisan make:middleware name
    ```

- 创建迁移文件

    ``` php
        php artisan make:migration
        [--create[="..."]] // 被创建的数据表
        [--table[="..."]] // 被迁移的数据表
        name
    ```

- 创建模型类

    ``` php
        php artisan make:model name
    ```

- 创建服务提供者类

    ``` php
        php artisan make:provider name
    ```

- 创建表单请求类

    ``` php
        php artisan make:request name
    ```

## 4. 运维维护类命令

- 进入交互模式

    ``` php
        php artisan tinker
    ```

- 进入维护模式

    ``` php
        php artisan --down
    ```

- 推出维护模式

    ``` php
        php artisan up
    ```

- 启动内置服务器

    ``` php
        php artisan serve  
        --port 80 //默认端口
        --host 0.0.0.0 //服务器
    ```

- 更改应用命名空间

    ``` php
        php artisan app:name namespace
    ```

- 清除过期的密码重置令牌

    ``` php
        php artisan auth:clear-resets
    ```

- 清空应用缓存

    ``` php
        php artisan cache:clear
    ```

- 创建缓存数据库表migration

    ``` php
        php artisan cache:table
    ```

- 合并配置信息到缓存

    ``` php
        php artisan config:cache
    ```

- 生成路由缓存文件

    ``` php
        php artisan route:cache
    ```

- 移除路由缓存文件

    ``` php
        php artisan route:clear
    ```

- 显示已注册的路由

    ``` php
        php artisan route:list
    ```

- 运行所有假数据生成

    ``` php
        php artisan db:seed [--class[="..."]] [--database[="..."]] [--force]
    ```

- 显示当前环境

    ``` php
        php artisan --env
    ```

- 监听指定的队列

    ``` php
        php artisan queue:listen
        [--queue[=".."]] // 被监听的队列
        [--delay[="..."]] // 给执行失败的任务设置延时时间
        [--memory[="..."]] // 内存限制大小，单位为mb
        [--timeout[="..."]] // 指定任务运行超时秒数
        [--sleep[="..."]] // 等待队列的时间
        [--tries[="..."]] // 任务记录失败重试次数
        [connection]
    ```

- 查看失败的队列

    ``` php
        php artisan queue:failed
    ```

- 为执行失败的数据表任务创建一个迁移

    ``` php
        php artisan queue:failed-table
    ```

- 清除所有执行失败的队列任务

    ``` php
        php artisan queue:flush
    ```

- 删除一个执行失败的队列任务

    ``` php
        php artisan queue:forget
    ```

- 当前的队列任务完成后，重启队列的守护进程

    ``` php
        php artisan queue:restart
    ```

- 对指定id的执行失败的队列任务进行重试

    ``` php
        php artisan queue:retry id
    ```

- 指定订阅Iron.io队列的链接

    ``` php
        php artisan queue:subscribe
        [--type[="..."]] // 推送类型
        queue //队列名称
        url // 被订阅的url
    ```

- 处理下一个队列任务

    ``` php
        php artisan queue:work
        [--queue[=".."]] // 被监听的队列
        [--daemon] // 后台模式运行
        [--delay[="..."]] // 给执行失败的任务设置延时时间
        [--force] // 强制在 维护模式 下运行
        [--memory[="..."]] // 内存大小限制，单位mb
        [--sleep[="..."]] // 当没有任务处于有效状态时，设置进入休眠的时间
        [--tries[="..."]] // 任务记录失败重试次数
        [connection]
    ```

- 运行计划命令

    ``` php
        php artisan schedule:run
    ```

- 为session生成迁移文件

    ``` php
        php artisan session:table
    ```

- 从vendor的扩展包中发布任何可发布的资源

    ``` php
        php artisan vendor:publish
        [--force] // 重写所有已存在的文件
        [--provider[="..."]] // 指定想要发布资源文件的服务提供者
        [--tag[="..."]] // 指定发布标记资源
    ```

## 5. 数据库迁移相关

- 数据库迁移

    ``` php
        php artisan migrate
        [--database[="..."]] // 指定数据库链接
        [--force] // 对处于生产环境时强制执行，不询问
        [--path[="..."]] // 指定单独迁移文件地址
        [--pretend] // 把将要运行的sql语句打印出来
        [--seed] // seed任务是否需要被重新运行
    ```

- 创建迁移数据库表

    ``` php
        php artisan migrate:install [--database[="..."]]
    ```

- 重置并重新运行所有的migrations

    ``` php
        php artisan migrate:refresh [--database[="..."]] [--force] [--seed]
        [--seeder[="..."]] // 指定主seeder的类名
    ```

- 回滚所有的数据库迁移

    ``` php
        php artisan migrate:reset [--database[="..."]] [--force] [--pretend]
    ```

- 回滚最近一次运行的迁移任务

    ``` php
        php artisan migrate:rollback [--database[="..."]] [--force] [--pretend]
    ```

- 数据库表信息

    ``` php
        php artisan migrate:status
    ```

- 威队列数据库表创建一个新的迁移

    ``` php
        php artisan queue:table
    ```

## 6. 创建命令