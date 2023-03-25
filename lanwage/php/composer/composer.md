# composer

## 1. 镜像相关

1. **系统全局配置**

    ``` php
        composer config -g repo.packagist composer https://packagist.phpcomposer.com
    ```

2. **单个项目配置**

    1. 修改composer.json，新增配置

        ``` js
            "repositories": {
                "packagist": {
                    "type": "composer",
                    "url": "https://packagist.phpcomposer.com"
                }
            }
        ```

    2. 终端配置

        ``` php
            composer config repo.packagist composer https://packagist.phpcomposer.com
        ```

3. **取消镜像**

    ``` php
        composer config -g --unset repos.packagist
    ```

4. **composer的安装**

5. **composer命令行**

    > ***全局参数*** 以下参数可与每一个命令共同使用
    > - **--verbose (-v):** 增加反馈信息的详细程度
    >   - -v 表示正常输出
    >   - -vv 表示更详细的输出
    >   - -vvv 为了debug
    > - **--help(-h):** 显示帮助信息
    > - **--quiet(-q):** 禁止输出任何信息
    > - **--no-interaction(-n):** 不要询问任何交互问题
    > - **--working-dir (-d):** 如果指定的话，使用给定的目录作为工作目录
    > - **--profile:** 显示时间和内存的使用信息
    > - **--ansi:** 强制ansi输出
    > - **--no-ansi--:** 关闭ansi输出
    > - **--version (-V):** 显示当前应用程序的版本信息

    - 进程退出代码
        - 0:正常
        - 1：通用/未知错误
        - 2：依赖关系处理错误

    - 初始化 init
        > **--name:** 包的名称。
        > **--description:** 包的描述。
        > **--author:** 包的作者。
        > **--homepage:** 包的主页。
        > **--require:** 需要依赖的其它包，必须要有一个版本约束。并且应该遵循 foo/bar:1.0.0 这样的格式。
        > **--require-dev:** 开发版的依赖包，内容格式与 --require 相同。
        > **--stability (-s):** minimum-stability 字段的值。

    - 安装 install - - 参数
        > **--prefer-source:** 下载包的方式有两种： source 和 dist。对于稳定版本 composer 将默认使用 dist 方式。而 source 表示版本控制源 。如果 --prefer-source 是被启用的，composer 将从 source 安装（如果有的话）。如果想要使用一个 bugfix 到你的项目，这是非常有用的。并且可以直接从本地的版本库直接获取依赖关系。
        > **--prefer-dist:** 与 --prefer-source 相反，composer 将尽可能的从 dist 获取，这将大幅度的加快在 build servers 上的安装。这也是一个回避 git 问题的途径，如果你不清楚如何正确的设置。
        > **--dry-run:** 如果你只是想演示而并非实际安装一个包，你可以运行 --dry-run 命令，它将模拟安装并显示将会发生什么。
        > **--dev:** 安装 require-dev 字段中列出的包（这是一个默认值）。
        > **--no-dev:** 跳过 require-dev 字段中列出的包。
        > **--no-scripts:** 跳过 composer.json 文件中定义的脚本。
        > **--no-plugins:** 关闭 plugins。
        > **--no-progress:** 移除进度信息，这可以避免一些不处理换行的终端或脚本出现混乱的显示。
        > **--optimize-autoloader (-o):** 转换 PSR-0/4 autoloading 到 classmap 可以获得更快的加载支持。特别是在生产环境下建议这么做，但由于运行需要一些时间，因此并没有作为默认值
    - 更新 update - - 参数
        如果你只是想更新几个包，你可以像这样分别列出它们：

        ``` php
            php composer.phar update vendor/package vendor/package2
        ```

        你还可以使用通配符进行批量更新：

        ``` php
            php composer.phar update vendor/*
        ```

        > **--prefer-source:** 当有可用的包时，从 source 安装。
        > **--prefer-dist:** 当有可用的包时，从 dist 安装。
        > **--dry-run:** 模拟命令，并没有做实际的操作。
        > **--dev:** 安装 require-dev 字段中列出的包（这是一个默认值）。
        > **--no-dev:** 跳过 require-dev 字段中列出的包。
        > **--no-scripts:** 跳过 composer.json 文件中定义的脚本。
        > **--no-plugins:** 关闭 plugins。
        > **--no-progress:** 移除进度信息，这可以避免一些不处理换行的终端或脚本出现混乱的显示。
        > **--optimize-autoloader (-o):** 转换 PSR-0/4 autoloading 到 classmap 可以获得更快的加载支持。特别是在生产环境下建议这么做，但由于运行需要一些时间，因此并没有作为默认值。
        > **--lock:** 仅更新 lock 文件的 hash，取消有关 lock 文件过时的警告。
        > **--with-dependencies** 同时更新白名单内包的依赖关系，这将进行递归更新。

    - 申明依赖 require - - 参数
        在添加或改变依赖时， 修改后的依赖关系将被安装或者更新。

        如果你不希望通过交互来指定依赖包，你可以在这条令中直接指明依赖包。

        ``` php
            php composer.phar require vendor/package:2.* vendor/package2:dev-master
        ```

        申明依赖-参数
        > **--prefer-source:** 当有可用的包时，从 source 安装。
        > **--prefer-dist:** 当有可用的包时，从 dist 安装。
        > **--dev:** 安装 require-dev 字段中列出的包。
        > **--no-update:** 禁用依赖关系的自动更新。
        > **--no-progress:** 移除进度信息，这可以避免一些不处理换行的终端或脚本出现混乱的显示。
        > **--update-with-dependencies** 一并更新新装包的依赖。

    - 全局执行 global
        并且如果你将 $COMPOSER_HOME/vendor/bin 加入到了 $PATH 环境变量中，你就可以用它在命令行中安装全局应用，下面是一个例子：

        ``` php
            php composer.phar global require fabpot/php-cs-fixer:dev-master
        ```

        现在 php-cs-fixer 就可以在全局范围使用了（假设你已经设置了你的 PATH）。如果稍后你想更新它，你只需要运行 global update：

        ``` php
            php composer.phar global update
        ```

    - 搜索 search - - 参数
        搜索-参数
        > **--only-name (-N):** 仅针对指定的名称搜索（完全匹配）
    - 展示 show - - 参数
        展示-参数
        > **--installed (-i):** 列出已安装的依赖包。
        > **--platform (-p):** 仅列出平台软件包（PHP 与它的扩展）。
        > **--self (-s):** 仅列出当前项目信息。
    - 依赖性检测 depends - - 参数
        depends 命令可以查出已安装在你项目中的某个包，是否正在被其它的包所依赖，并列出他们。

        依赖性检测-参数
        > **--link-type:** 检测的类型，默认为 require 也可以是 require-dev。
    - 有效性检测 validate
        在提交 composer.json 文件，和创建 tag 前，你应该始终运行 validate 命令。它将检测你的 composer.json 文件是否是有效的

        有效性检测参数
        > **--no-check-all:** Composer 是否进行完整的校验。

    - 依赖包状态检测 status
        如果你经常修改依赖包里的代码，并且它们是从 source（自定义源）进行安装的，那么 status 命令允许你进行检查，如果你有任何本地的更改它将会给予提示。

        你可以使用 --verbose 系列参数（-v|vv|vvv）来获取更详细的详细：

    - 自我更新 self-update - - 参数
        将 Composer 自身升级到最新版本，只需要运行 self-update 命令。它将替换你的 composer.phar 文件到最新版本。

        如果你想要升级到一个特定的版本，可以这样简单的指定它：

        ``` php
            php composer.phar self-update 1.0.0-alpha7
        ```

        如果你已经为整个系统安装 Composer（参见 全局安装），你可能需要在 root 权限下运行它：

        ``` php
            sudo composer self-update
        ```

        自我更新-参数
        > **--rollback (-r):** 回滚到你已经安装的最后一个版本。
        > **--clean-backups:** 在更新过程中删除旧的备份，这使得更新过后的当前版本是唯一可用的备份。

    - 更改配置 config - - 使用方法 - - 参数 - - 修改包来源
        config 命令允许你编辑 Composer 的一些基本设置，无论是本地的 composer.json 或者全局的 config.json 文件。

        ``` php
            php composer.phar config --list
        ```

        更改配置-使用方法

        ``` php
            config [options] [setting-key] [setting-value1] ... [setting-valueN]
        ```

        setting-key 是一个配置选项的名称，setting-value1 是一个配置的值。可以使用数组作为配置的值（像 github-protocols），多个 setting-value 是允许的。

        有效的配置选项，请查看“架构”章节的 config 。

        更改配置-参数
        > **--global (-g):** 操作位于 $COMPOSER_HOME/config.json 的全局配置文件。如果不指定该参数，此命令将影响当前项目的 composer.json 文件，或 --file 参数所指向的文件。
        > **--editor (-e):** 使用文本编辑器打开 composer.json 文件。默认情况下始终是打开当前项目的文件。当存在 --global 参数时，将会打开全局 composer.json 文件。
        > **--unset:** 移除由 setting-key 指定名称的配置选项。
        > **--list (-l):** 显示当前配置选项的列表。当存在 --global 参数时，将会显示全局配置选项的列表。
        > **--file="..." (-f):** 在一个指定的文件上操作，而不是 composer.json。注意：不能与 --global 参数一起使用。

        修改包来源
        除了修改配置选项， config 命令还支持通过以下方法修改来源信息：

        ``` php
            php composer.phar config repositories.foo vcs http://github.com/foo/bar
        ```

    - 创建项目 create-project - - 参数
        你可以使用 Composer 从现有的包中创建一个新的项目。这相当于执行了一个 git clone 或 svn checkout 命令后将这个包的依赖安装到它自己的 vendor 目录。

        此命令有几个常见的用途：

            你可以快速的部署你的应用。
            你可以检出任何资源包，并开发它的补丁。
            多人开发项目，可以用它来加快应用的初始化。
            要创建基于 Composer 的新项目，你可以使用 "create-project" 命令。传递一个包名，它会为你创建项目的目录。你也可以在第三个参数中指定版本号，否则将获取最新的版本。

        如果该目录目前不存在，则会在安装过程中自动创建。

        ```php
            php composer.phar create-project doctrine/orm path 2.2.*
        ```

        此外，你也可以无需使用这个命令，而是通过现有的 composer.json 文件来启动这个项目。

        默认情况下，这个命令会在 packagist.org 上查找你指定的包。

        创建项目-参数
        > **--repository-url:** 提供一个自定义的储存库来搜索包，这将被用来代替 packagist.org。可以是一个指向 composer 资源库的 HTTP URL，或者是指向某个 packages.json 文件的本地路径。
        > **--stability (-s):** 资源包的最低稳定版本，默认为 stable。
        > **--prefer-source:** 当有可用的包时，从 source 安装。
        > **--prefer-dist:** 当有可用的包时，从 dist 安装。
        > **--dev:** 安装 require-dev 字段中列出的包。
        > **--no-install:** 禁止安装包的依赖。
        > **--no-plugins:** 禁用 plugins。
        > **--no-scripts:** 禁止在根资源包中定义的脚本执行。
        > **--no-progress:** 移除进度信息，这可以避免一些不处理换行的终端或脚本出现混乱的显示。
        > **--keep-vcs:** 创建时跳过缺失的 VCS 。如果你在非交互模式下运行创建命令，这将是非常有用的。

    - 打印自动加载索引 dump-autoload - - 参数
        某些情况下你需要更新 autoloader，例如在你的包中加入了一个新的类。你可以使用 dump-autoload 来完成，而不必执行 install 或 update 命令。

        此外，它可以打印一个优化过的，符合 PSR-0/4 规范的类的索引，这也是出于对性能的可考虑。在大型的应用中会有许多类文件，而 autoloader 会占用每个请求的很大一部分时间，使用 classmaps 或许在开发时不太方便，但它在保证性能的前提下，仍然可以获得 PSR-0/4 规范带来的便利。

        打印自动加载索引-参数
        > **--optimize (-o):** 转换 PSR-0/4 autoloading 到 classmap 获得更快的载入速度。这特别适用于生产环境，但可能需要一些时间来运行，因此它目前不是默认设置。
        > **--no-dev:** 禁用 autoload-dev 规则。

    - 查看许可协议 licenses
        列出已安装的每个包的名称、版本、许可协议。可以使用 --format=json 参数来获取 JSON 格式的输出。

    - 执行脚本 run-script
        你可以运行此命令来手动执行 脚本，只需要指定脚本的名称，可选的 --no-dev 参数允许你禁用开发者模式。

    - 诊断 diagnose
        如果你觉得发现了一个 bug 或是程序行为变得怪异，你可能需要运行 diagnose 命令，来帮助你检测一些常见的问题。

    - 归档 archive - - 参数
        此命令用来对指定包的指定版本进行 zip/tar 归档。它也可以用来归档你的整个项目，不包括 excluded/ignored（排除/忽略）的文件。

        ``` php
            php composer.phar archive vendor/package 2.0.21 --format=zip
        ```

        归档-参数
        > **--format (-f):** 指定归档格式：tar 或 zip（默认为 tar）。
        > **--dir:** 指定归档存放的目录（默认为当前目录）。

    - 获取帮助信息 help
        使用 help 可以获取指定命令的帮助信息。

    - 环境变量
        你可以设置一些环境变量来覆盖默认的配置。建议尽可能的在 composer.json 的 config 字段中设置这些值，而不是通过命令行设置环境变量。值得注意的是环境变量中的值，将始终优先于 composer.json 中所指定的值。

        - COMPOSER
            环境变量 COMPOSER 可以为 composer.json 文件指定其它的文件名。

            例如：

            ``` php
                COMPOSER=composer-other.json php composer.phar install
            ```

        - COMPOSER_ROOT_VERSION
            通过设置这个环境变量，你可以指定 root 包的版本，如果程序不能从 VCS 上猜测出版本号，并且未在 composer.json 文件中申明。

        - COMPOSER_VENDOR_DIR
            通过设置这个环境变量，你可以指定 composer 将依赖安装在 vendor 以外的其它目录中。

        - COMPOSER_BIN_DIR
            通过设置这个环境变量，你可以指定 bin（Vendor Binaries）目录到 vendor/bin 以外的其它目录。

        - http_proxy or HTTP_PROXY
            如果你是通过 HTTP 代理来使用 Composer，你可以使用 http_proxy 或 HTTP_PROXY 环境变量。只要简单的将它设置为代理服务器的 URL。许多操作系统已经为你的服务设置了此变量。

            建议使用 http_proxy（小写）或者两者都进行定义。因为某些工具，像 git 或 curl 将使用 http_proxy 小写的版本。另外，你还可以使用 git config --global http.proxy [proxy url] 来单独设置 git 的代理。

        - no_proxy
            如果你是使用代理服务器，并且想要对某些域名禁用代理，就可以使用 no_proxy 环境变量。只需要输入一个逗号相隔的域名 排除 列表。

            此环境变量接受域名、IP 以及 CIDR地址块。你可以将它限制到一个端口（例如：:80）。你还可以把它设置为 * 来忽略所有的 HTTP 代理请求。

        - HTTP_PROXY_REQUEST_FULLURI
            如果你使用了 HTTP 代理，但它不支持 request_fulluri 标签，那么你应该设置这个环境变量为 false 或 0 ，来防止 composer 从 request_fulluri 读取配置。

        - HTTPS_PROXY_REQUEST_FULLURI
            如果你使用了 HTTPS 代理，但它不支持 request_fulluri 标签，那么你应该设置这个环境变量为 false 或 0 ，来防止 composer 从 request_fulluri 读取配置。

        - COMPOSER_HOME
            COMPOSER_HOME 环境变量允许你改变 Composer 的主目录。这是一个隐藏的、所有项目共享的全局目录（对本机的所有用户都可用）。

            它在各个系统上的默认值分别为：

                - *nix /home/<user>/.composer。
                - OSX /Users/<user>/.composer。
                - Windows C:\Users\<user>\AppData\Roaming\Composer。

            COMPOSER_HOME/config.json
            你可以在 COMPOSER_HOME 目录中放置一个 config.json 文件。在你执行 install 和 update 命令时，Composer 会将它与你项目中的 composer.json 文件进行合并。

            该文件允许你为用户的项目设置 配置信息 和 资源库。

            若 全局 和 项目 存在相同配置项，那么项目中的 composer.json 文件拥有更高的优先级。

        - COMPOSER_HOME/config.json
            你可以在 COMPOSER_HOME 目录中放置一个 config.json 文件。在你执行 install 和 update 命令时，Composer 会将它与你项目中的 composer.json 文件进行合并。

            该文件允许你为用户的项目设置 配置信息 和 资源库。

            若 全局 和 项目 存在相同配置项，那么项目中的 composer.json 文件拥有更高的优先级。

        - COMPOSER_CACHE_DIR
            COMPOSER_CACHE_DIR 环境变量允许你设置 Composer 的缓存目录，这也可以通过 cache-dir 进行配置。

            它在各个系统上的默认值分别为:

                - *nix and OSX $COMPOSER_HOME/cache。
                - Windows C:\Users\<user>\AppData\Local\Composer 或 %LOCALAPPDATA%/Composer。

        - COMPOSER_PROCESS_TIMEOUT
            这个环境变量控制着 Composer 执行命令的等待时间（例如：git 命令）。默认值为300秒（5分钟）

        - COMPOSER_DISCARD_CHANGES
            这个环境变量控制着 discard-changes config option。

        - COMPOSER_NO_INTERACTION
            如果设置为1，这个环境变量将使 Composer 在执行每一个命令时都放弃交互，相当于对所有命令都使用了 --no-interaction。可以在搭建 虚拟机/持续集成服务器 时这样设置。

6. **composer.json架构**
    - **JSON schema**
        我们有一个 JSON schema 格式化文档，它也可以被用来验证你的 composer.json 文件。事实上，它已经被 validate 命令所使用。 你可以在这里找到它： res/composer-schema.json.

    - **Root 包**
        “root 包”是指由 composer.json 定义的在你项目根目录的包。这是 composer.json 定义你项目所需的主要条件。（简单的说，你自己的项目就是一个 root 包）
        某些字段仅适用于“root 包”上下文。 config 字段就是其中一个例子。只有“root 包”可以定义。在依赖包中定义的 config 字段将被忽略，这使得 config 字段只有“root 包”可用（root-only）。
        如果你克隆了其中的一个依赖包，直接在其上开始工作，那么它就变成了“root 包”。与作为他人的依赖包时使用相同的 composer.json 文件，但上下文发生了变化。
        ***注意：*** 一个资源包是不是“root 包”，取决于它的上下文。 例：如果你的项目依赖 monolog 库，那么你的项目就是“root 包”。 但是，如果你从 GitHub 上克隆了 monolog 为它修复 bug， 那么此时 monolog 就是“root 包”。

    - **属性**
        - 包名 name
            包的名称，它包括供应商名称和项目名称，使用 / 分隔。

            例：

                - monolog/monolog
                - igorw/event-source
            对于需要发布的包（库），这是必须填写的。

    - **描述 description**
        一个包的简短描述。通常这个最长只有一行。

        对于需要发布的包（库），这是必须填写的。

    - **版本 version**
        version 不是必须的，并且建议忽略（见下文）。

        它应该符合 'X.Y.Z' 或者 'vX.Y.Z' 的形式， -dev、-patch、-alpha、-beta 或 -RC 这些后缀是可选的。在后缀之后也可以再跟上一个数字。

        例：

            - 1.0.0
            - 1.0.2
            - 1.1.0
            - 0.2.5
            - 1.0.0-dev
            - 1.0.0-alpha3
            - 1.0.0-beta2
            - 1.0.0-RC5
        通常，我们能够从 VCS (git, svn, hg) 的信息推断出包的版本号，在这种情况下，我们建议忽略 version。

        ***注意：*** Packagist 使用 VCS 仓库， 因此 version 定义的版本号必须是真实准确的。 自己手动指定的 version，最终有可能在某个时候因为人为错误造成问题。

    - **安装类型 type**
        包的安装类型，默认为 library。

        包的安装类型，用来定义安装逻辑。如果你有一个包需要一个特殊的逻辑，你可以设定一个自定义的类型。这可以是一个 symfony-bundle，一个 wordpress-plugin 或者一个 typo3-module。这些类型都将是具体到某一个项目，而对应的项目将要提供一种能够安装该类型包的安装程序。

        composer 原生支持以下4种类型：

            - library: 这是默认类型，它会简单的将文件复制到 vendor 目录。
            - project: 这表示当前包是一个项目，而不是一个库。例：框架应用程序 Symfony standard edition，内容管理系统 SilverStripe installer 或者完全成熟的分布式应用程序。使用 IDE 创建一个新的工作区时，这可以为其提供项目列表的初始化。
            - metapackage: 当一个空的包，包含依赖并且需要触发依赖的安装，这将不会对系统写入额外的文件。因此这种安装类型并不需要一个 dist 或 source。
            - composer-plugin: 一个安装类型为 composer-plugin 的包，它有一个自定义安装类型，可以为其它包提供一个 installler。详细请查看 自定义安装类型。
        仅在你需要一个自定义的安装逻辑时才使用它。建议忽略这个属性，采用默认的 library。

    - **关键字 keywords**
        该包相关的关键词的数组。这些可用于搜索和过滤。

        实例：

            - logging
            - events
            - database
            - redis
            - templating
        可选。

    - **项目主页 homepage**
        该项目网站的 URL 地址。

        可选。

    - **版本发布时间 time**
        版本发布时间。

        必须符合 YYYY-MM-DD 或 YYYY-MM-DD HH:MM:SS 格式。

        可选。

    - **许可协议 license**
        包的许可协议，它可以是一个字符串或者字符串数组。

        最常见的许可协议的推荐写法（按字母排序）：

            - Apache-2.0
            - BSD-2-Clause
            - BSD-3-Clause
            - BSD-4-Clause
            - GPL-2.0
            - GPL-2.0+
            - GPL-3.0
            - GPL-3.0+
            - LGPL-2.1
            - LGPL-2.1+
            - LGPL-3.0
            - LGPL-3.0+
            - MIT
        可选，但强烈建议提供此内容。更多许可协议的标识符请参见 [SPDX Open Source License Registry](http://www.spdx.org/licenses/)。

        对于闭源软件，你必须使用 "proprietary" 协议标识符。

        一个例：

        ``` php
            {
                "license": "MIT"
            }
        ```

        对于一个包，当允许在多个许可协议间进行选择时（"disjunctive license"），这些协议标识符可以被指定为数组。

        多协议的一个例：

        ``` php
            {
                "license": [
                "LGPL-2.1",
                "GPL-3.0+"
                ]
            }
        ```

        另外它们也可以由 "or" 分隔，并写在括号中：

        ``` php
            {
                "license": "(LGPL-2.1 or GPL-3.0+)"
            }
        ```

        同样，当有多个许可协议需要结合使用时（"conjunctive license"），它们应该被 "and" 分隔，并写在括号中。

    - **作者 authors**
        包的作者。这是一个对象数组。

        这个对象必须包含以下属性:

            - name: 作者的姓名，通常使用真名。
            - email: 作者的 email 地址。
            - homepage: 作者主页的 URL 地址。
            - role: 该作者在此项目中担任的角色（例：开发人员 或 翻译）。
        一个实例：

        ``` php
            {
                "authors": [
                    {
                        "name": "Nils Adermann",
                        "email": "naderman@naderman.de",
                        "homepage": "http://www.naderman.de",
                        "role": "Developer"
                    },
                    {
                        "name": "Jordi Boggiano",
                        "email": "j.boggiano@seld.be",
                        "homepage": "http://seld.be",
                        "role": "Developer"
                    }
                ]
            }
        ```

        可选，但强烈建议提供此内容。

    - **支持 support**
        获取项目支持的向相关信息对象。

        这个对象必须包含以下属性:

            - email: 项目支持 email 地址。
            - issues: 跟踪问题的 URL 地址。
            - forum: 论坛地址。
            - wiki: Wiki 地址。
            - irc: IRC 聊天频道地址，类似于 irc://server/channel。
            - source: 网址浏览或下载源。
        一个实例：

        ``` php
            {
                "support": {
                    "email": "support@example.org",
                    "irc": "irc://irc.freenode.org/composer"
                }
            }
        ```

        可选。

    - **Package links**
        下面提到的所有对象，都应该是 包名 到 版本 的映射对象。

        实例：

        ``` php
            {
                "require": {
                    "monolog/monolog": "1.0.*"
                }
            }
        ```

        所有的这些都是可选的。

        require 和 require-dev 还支持稳定性标签（@，仅针对“root 包”）。这允许你在 minimum-stability 设定的范围外做进一步的限制或扩展。例：如果你想允许依赖一个不稳定的包，你可以在一个包的版本约束后使用它，或者是一个空的版本约束内使用它。

        实例：

        ``` php
            {
                "require": {
                    "monolog/monolog": "1.0.*@beta",
                    "acme/foo": "@dev"
                }
            }
        ```

        如果你的依赖之一，有对另一个不稳定包的依赖，你最好在 require 中显示的定义它，并带上足够详细的稳定性标识。

        实例：

        ``` php
            {
                "require": {
                    "doctrine/doctrine-fixtures-bundle": "dev-master",
                    "doctrine/data-fixtures": "@dev"
                }
            }
        ```

        require 和 require-dev 还支持对 dev（开发）版本的明确引用（即：版本控制系统中的提交编号 commit），以确保它们被锁定到一个给定的状态，即使你运行了更新命令。你只需要明确一个开发版本号，并带上诸如 #【ref】 的标识。

        实例：

        ``` php
            {
                "require": {
                    "monolog/monolog": "dev-master#2eb0c0978d290a1c45346a1955188929cb4e5db7",
                    "acme/foo": "1.0.x-dev#abc123"
                }
            }
        ```

        ***注意：*** 虽然这有时很方便，但不应该长期在你的包中使用，因为它有一个技术上的限制。 composer.json 将仍然在哈希值之前指定的分支名称读取元数据， 正因为如此，在某些情况下，它不会是一个实用的解决方法， 如果可能，你应该总是尝试切换到拥有标签的版本。

        它也可以应用于行内别名，这样它将匹配一个约束，否则不会。更多信息请参考 别名。

        require
        必须的软件包列表，除非这些依赖被满足，否则不会完成安装。

        require-dev (root-only)
        这个列表是为开发或测试等目的，额外列出的依赖。“root 包”的 require-dev 默认是会被安装的。然而 install 或 update 支持使用 --no-dev 参数来跳过 require-dev 字段中列出的包。

        conflict
        此列表中的包与当前包的这个版本冲突。它们将不允许同时被安装。

        请注意，在 conflict 中指定类似于 <1.0, >= 1.1 的版本范围时，这表示它与小于1.0 并且 同时大等于1.1的版本冲突，这很可能不是你想要的。在这种情况下你可能想要表达的是 <1.0 | >= 1.1 。

        replace
        这个列表中的包将被当前包取代。这使你可以 fork 一个包，以不同的名称和版本号发布，同时要求依赖于原包的其它包，在这之后依赖于你 fork 的这个包，因为它取代了原来的包。

        这对于创建一个内部包含子包的主包也非常的有用。例如 symfony/symfony 这个主包，包含了所有 Symfony 的组件，而这些组件又可以作为单独的包进行发布。如果你 require 了主包，那么它就会自动完成其下各个组件的任务，因为主包取代了子包。

        注意，在使用上述方法取代子包时，通常你应该只对子包使用 self.version 这一个版本约束，以确保主包仅替换掉子包的准确版本，而不是任何其他版本。

        provide
        List of other packages that are provided by this package. This is mostly useful for common interfaces. A package could depend on some virtual logger package, any library that implements this logger interface would simply list it in provide.

    - **suggest**
        建议安装的包，它们增强或能够与当前包良好的工作。这些只是信息，并显示在依赖包安装完成之后，给你的用户一个建议，他们可以添加更多的包。

        格式如下，版本约束变成了描述信息。

        实例：

        ``` php
            {
                "suggest": {
                    "monolog/monolog": "Allows more advanced logging of the application flow"
                }
            }
        ```

    - **autoload**
        PHP autoloader 的自动加载映射。

        Currently PSR-0 autoloading, PSR-4 autoloading, classmap generation and files includes are supported. PSR-4 is the recommended way though since it offers greater ease of use (no need to regenerate the autoloader when you add classes).

    - **PSR-4**
        Under the psr-4 key you define a mapping from namespaces to paths, relative to the package root. When autoloading a class like Foo\\Bar\\Baz a namespace prefix Foo\\ pointing to a directory src/ means that the autoloader will look for a file named src/Bar/Baz.php and include it if present. Note that as opposed to the older PSR-0 style, the prefix (Foo\\) is not present in the file path.

        Namespace prefixes must end in \\ to avoid conflicts between similar prefixes. For example Foo would match classes in the FooBar namespace so the trailing backslashes solve the problem: Foo\\ and FooBar\\ are distinct.

        The PSR-4 references are all combined, during install/update, into a single key => value array which may be found in the generated file vendor/composer/autoload_psr4.php.

        Example:

        ``` php
            {
                "autoload": {
                    "psr-4": {
                        "Monolog\\": "src/",
                        "Vendor\\Namespace\\": ""
                    }
                }
            }
        ```

        If you need to search for a same prefix in multiple directories, you can specify them as an array as such:

        ``` php
            {
                "autoload": {
                    "psr-4": { "Monolog\\": ["src/", "lib/"] }
                }
            }
        ```

        If you want to have a fallback directory where any namespace will be looked for, you can use an empty prefix like:

        ``` php
            {
                "autoload": {
                    "psr-4": { "": "src/" }
                }
            }
        ```

    - **PSR-0**
        在 psr-0 key 下你定义了一个命名空间到实际路径的映射（相对于包的根目录）。注意，这里同样支持 PEAR-style 方式的约定（与命名空间不同，PEAR 类库在类名上采用了下划线分隔）。

        请注意，命名空间的申明应该以 \\ 结束，以确保 autoloader 能够准确响应。例： Foo 将会与 FooBar 匹配，然而以反斜杠结束就可以解决这样的问题， Foo\\ 和 FooBar\\ 将会被区分开来。

        在 install/update 过程中，PSR-0 引用都将被结合为一个单一的键值对数组，存储至 vendor/composer/autoload_namespaces.php 文件中。

        实例：

        ``` php
            {
                "autoload": {
                    "psr-0": {
                        "Monolog\\": "src/",
                        "Vendor\\Namespace\\": "src/",
                        "Vendor_Namespace_": "src/"
                    }
                }
            }
        ```

        如果你需要搜索多个目录中一个相同的前缀，你可以将它们指定为一个数组，例：

        ``` php
            {
                "autoload": {
                    "psr-0": { "Monolog\\": ["src/", "lib/"] }
                }
            }
        ```

        PSR-0 方式并不仅限于申明命名空间，也可以是精确到类级别的指定。这对于只有一个类在全局命名空间的类库是非常有用的（如果 php 源文件也位于包的根目录）。例如，可以这样申明：

        ``` php
            {
                "autoload": {
                    "psr-0": { "UniqueGlobalClass": "" }
                }
            }
        ```

        如果你想设置一个目录作为任何命名空间的备用目录，你可以使用空的前缀，像这样：

        ``` php
            {
                "autoload": {
                    "psr-0": { "": "src/" }
                }
            }
        ```

    - **Classmap**
        classmap 引用的所有组合，都会在 install/update 过程中生成，并存储到 vendor/composer/autoload_classmap.php 文件中。这个 map 是经过扫描指定目录（同样支持直接精确到文件）中所有的 .php 和 .inc 文件里内置的类而得到的。

        你可以用 classmap 生成支持支持自定义加载的不遵循 PSR-0/4 规范的类库。要配置它指向需要的目录，以便能够准确搜索到类文件。

        实例：

        ``` php
            {
                "autoload": {
                    "classmap": ["src/", "lib/", "Something.php"]
                }
            }
        ```

    - **Files**
        如果你想要明确的指定，在每次请求时都要载入某些文件，那么你可以使用 'files' autoloading。通常作为函数库的载入方式（而非类库）。

        实例：

        ``` php
            {
                "autoload": {
                    "files": ["src/MyLibrary/functions.php"]
                }
            }
        ```

    - **autoload-dev (root-only)**
        This section allows to define autoload rules for development purposes.

        Classes needed to run the test suite should not be included in the main autoload rules to avoid polluting the autoloader in production and when other people use your package as a dependency.

        Therefore, it is a good idea to rely on a dedicated path for your unit tests and to add it within the autoload-dev section.

        Example:

        ``` php
            {
                "autoload": {
                    "psr-4": { "MyLibrary\\": "src/" }
                },
                "autoload-dev": {
                    "psr-4": { "MyLibrary\\Tests\\": "tests/" }
                }
            }
        ```

    - **include-path**
        ***不建议：***这是目前唯一支持传统项目的做法，所有新的代码都建议使用自动加载。 这是一个过时的做法，但 Composer 将仍然保留这个功能。

        一个追加到 PHP include_path 中的列表。

        实例：

        ``` php
            {
                "include-path": ["lib/"]
            }
        ```

        可选。

    - **target-dir**
        ***DEPRECATED:*** This is only present to support legacy PSR-0 style autoloading, and all new code should preferably use PSR-4 without target-dir and projects using PSR-0 with PHP namespaces are encouraged to migrate to PSR-4 instead.

        定义当前包安装的目标文件夹。

        若某个包的根目录，在它申明的命名空间之下，将不能正确的使用自动加载。而 target-dir 解决了这个问题。

        Symfony 就是一个例子。它有一些独立的包作为组件。Yaml 组件就放在 Symfony\Component\Yaml 目录下，然而这个包的根目录实际上是 Yaml。为了使自动加载成为可能，我们需要确保它不会被安装到 vendor/symfony/yaml，而是安装到 vendor/symfony/yaml/Symfony/Component/Yaml，从而使 Symfony 定义的 autoloader 可以从 vendor/symfony/yaml 加载它。

        要做到这一点 autoload 和 target-dir 应该定义如下：

        ``` php
            {
                "autoload": {
                    "psr-0": { "Symfony\\Component\\Yaml\\": "" }
                },
                "target-dir": "Symfony/Component/Yaml"
            }
        ```

        可选。

    - **minimum-stability (root-only)**
        这定义了通过稳定性过滤包的默认行为。默认为 stable（稳定）。因此如果你依赖于一个 dev（开发）包，你应该明确的进行定义。

        对每个包的所有版本都会进行稳定性检查，而低于 minimum-stability 所设定的最低稳定性的版本，将在解决依赖关系时被忽略。对于个别包的特殊稳定性要求，可以在 require 或 require-dev 中设定（请参考 Package links）。

        可用的稳定性标识（按字母排序）：dev、alpha、beta、RC、stable。

    - **prefer-stable (root-only)**
        当此选项被激活时，Composer 将优先使用更稳定的包版本。

        使用 "prefer-stable": true 来激活它。

    - **repositories (root-only)**
        使用自定义的包资源库。

        默认情况下 composer 只使用 packagist 作为包的资源库。通过指定资源库，你可以从其他地方获取资源包。

        Repositories 并不是递归调用的，只能在“Root包”的 composer.json 中定义。附属包中的 composer.json 将被忽略。

        支持以下类型的包资源库:

            - composer: 一个 composer 类型的资源库，是一个简单的网络服务器（HTTP、FTP、SSH）上的 packages.json 文件，它包含一个 composer.json 对象的列表，有额外的 dist 和/或 source 信息。这个 packages.json 文件是用一个 PHP 流加载的。你可以使用 options 参数来设定额外的流信息。
            - vcs: 从 git、svn 和 hg 取得资源。
            - pear: 从 pear 获取资源。
            - package: 如果你依赖于一个项目，它不提供任何对 composer 的支持，你就可以使用这种类型。你基本上就只需要内联一个 composer.json 对象。
        更多相关内容，请查看 资源库。

        实例：

        ``` php
            {
                "repositories": [
                    {
                        "type": "composer",
                        "url": "http://packages.example.com"
                    },
                    {
                        "type": "composer",
                        "url": "https://packages.example.com",
                        "options": {
                            "ssl": {
                                "verify_peer": "true"
                            }
                        }
                    },
                    {
                        "type": "vcs",
                        "url": "https://github.com/Seldaek/monolog"
                    },
                    {
                        "type": "pear",
                        "url": "http://pear2.php.net"
                    },
                    {
                        "type": "package",
                        "package": {
                            "name": "smarty/smarty",
                            "version": "3.1.7",
                            "dist": {
                                "url": "http://www.smarty.net/files/Smarty-3.1.7.zip",
                                "type": "zip"
                            },
                            "source": {
                                "url": "http://smarty-php.googlecode.com/svn/",
                                "type": "svn",
                                "reference": "tags/Smarty_3_1_7/distribution/"
                            }
                        }
                    }
                ]
            }
        ```

        ***注意：*** 顺序是非常重要的，当 Composer 查找资源包时，它会按照顺序进行。默认情况下 Packagist 是最后加入的，因此自定义设置将可以覆盖 Packagist 上的包。

    - **config (root-only)**
        下面的这一组选项，仅用于项目。

        支持以下选项:

            - process-timeout: 默认为 300。处理进程结束时间，例如：git 克隆的时间。Composer 将放弃超时的任务。如果你的网络缓慢或者正在使用一个巨大的包，你可能要将这个值设置的更高一些。
            - use-include-path: 默认为 false。如果为 true，Composer autoloader 还将在 PHP include path 中继续查找类文件。
            - preferred-install: 默认为 auto。它的值可以是 source、dist 或 auto。这个选项允许你设置 Composer 的默认安装方法。
            - github-protocols: 默认为 ["git", "https", "ssh"]。从 github.com 克隆时使用的协议优先级清单，因此默认情况下将优先使用 git 协议进行克隆。你可以重新排列它们的次序，例如，如果你的网络有代理服务器或 git 协议的效率很低，你就可以提升 https 协议的优先级。
            - github-oauth: 一个域名和 oauth keys 的列表。 例如：使用 {"github.com": "oauthtoken"} 作为此选项的值， 将使用 oauthtoken 来访问 github 上的私人仓库，并绕过 low IP-based rate 的 API 限制。 关联知识 关于如何获取 GitHub 的 OAuth token。
            - vendor-dir: 默认为 vendor。通过设置你可以安装依赖到不同的目录。
            - bin-dir: 默认为 vendor/bin。如果一个项目包含二进制文件，它们将被连接到这个目录。
            - cache-dir: unix 下默认为 $home/cache，Windows 下默认为 C:\Users\<user>\AppData\Local\Composer。用于存储 composer 所有的缓存文件。相关信息请查看 COMPOSER_HOME。
            - cache-files-dir: 默认为 $cache-dir/files。存储包 zip 存档的目录。
            - cache-repo-dir: 默认为 $cache-dir/repo。存储 composer 类型的 VCS（svn、github、bitbucket） repos 目录。
            - cache-vcs-dir: 默认为 $cache-dir/vcs。此目录用于存储 VCS 克隆的 git/hg 类型的元数据，并加快安装速度。
            - cache-files-ttl: 默认为 15552000（6个月）。默认情况下 Composer 缓存的所有数据都将在闲置6个月后被删除，这个选项允许你来调整这个时间，你可以将其设置为0以禁用缓存。
            - cache-files-maxsize: 默认为 300MiB。Composer 缓存的最大容量，超出后将优先清除旧的缓存数据，直到缓存量低于这个数值。
            - prepend-autoloader: 默认为 true。如果设置为 false，composer autoloader 将不会附加到现有的自动加载机制中。这有时候用来解决与其它自动加载机制产生的冲突。
            - autoloader-suffix: 默认为 null。Composer autoloader 的后缀，当设置为空时将会产生一个随机的字符串。
            - optimize-autoloader Defaults to false. Always optimize when dumping the autoloader.
            - github-domains: 默认为 ["github.com"]。一个 github mode 下的域名列表。这是用于GitHub的企业设置。
            - notify-on-install: 默认为 true。Composer 允许资源仓库定义一个用于通知的 URL，以便有人从其上安装资源包时能够得到一个反馈通知。此选项允许你禁用该行为。
            - discard-changes: 默认为 false，它的值可以是 true、false 或 stash。这个选项允许你设置在非交互模式下，当处理失败的更新时采用的处理方式。true 表示永远放弃更改。"stash" 表示继续尝试。Use this for CI servers or deploy scripts if you tend to have modified vendors.
        实例：

        ``` php
            {
                "config": {
                    "bin-dir": "bin"
                }
            }
        ```

    - **scripts (root-only)**
        Composer 允许你在安装过程中的各个阶段挂接脚本。

        更多细节和案例请查看 脚本。

    - **extra**
        任意的，供 scripts 使用的额外数据。.

        这可以是几乎任何东西。若要从脚本事件访问处理程序，你可以这样做:

        ``` php
            $extra = $event->getComposer()->getPackage()->getExtra();
        ```

        可选。

    - **bin**
        该属性用于标注一组应被视为二进制脚本的文件，他们会被软链接到（config 对象中的）bin-dir 属性所标注的目录，以供其他依赖包调用。

        详细请查看 [Vendor Binaries](https://docs.phpcomposer.com/articles/vendor-binaries.html)。

        可选。

    - **archive**
        这些选项在创建包存档时使用。

        支持以下选项:

            - exclude: 允许设置一个需要被排除的路径的列表。使用与 .gitignore 文件相同的语法。一个前导的（!）将会使其变成白名单而无视之前相同目录的排除设定。前导斜杠只会在项目的相对路径的开头匹配。星号为通配符。
        实例：

        ``` php
            {
                "archive": {
                    "exclude": ["/foo/bar", "baz", "/*.test", "!/foo/bar/baz"]
                }
            }
        ```

        在这个例子中我们 include /dir/foo/bar/file、/foo/bar/baz、/file.php、/foo/my.test 但排除了 /foo/bar/any、/foo/baz、/my.test。

        可选。

## 2. 错误处理

1. **运行错误**
    - zlib_decode()
    > Failed to decode response: zlib_decode(): data error

    ``` php
        composer clear-cache
    ```

    - 错误
    > Cannot create cache directory /home/w3cert/.composer/cache/repo/https---packagist.org/, or directory is not writable. Proceeding without cache.

    处理方式

    ``` php
        sudo chown -R w3cert /home/w3cert/.composer/cache/repo/https---packagist.org
        sudo chown -R w3cert /home/w3cert/.composer/cache/files/
    ```

    - 错误
    > proc_open(): fork failed - Cannot allocate memory

    处理方式

    ``` php
        提升内存
    ```

## 错误处理

### composer dump-aotuload

重新导composermigrate包

---
## 错误

###  your requirements could not be resolved to an installable set of packages

#### 错误原因
包b版本错误

#### 解决方法
1. composer install --ignore-platform-reqs
2. composer update --ignore-platform-reqs