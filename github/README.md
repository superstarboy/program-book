# github

## 建立自己的主页

步骤如下：

1. 在 github 上建立项目 repository。
2. 进入该 repository 的 Settings。
3. 在 Options 里面， 找到 GitHub Pages。
4. 为项目选择用于主页的分支， 然后保存。
5. 然后就可以在浏览器输入 https://username.github.io/projectname 来访问项目主页了。

## gitbook进阶

1. 在 gitbook.com 上发布和管理书籍
需要先注册 gitbook 账号。可以单独注册，也可以使用 github 账号关联登录。
然后先创建一个 Orgnization 。
再在这个 Orgnization 里面创建一个 Space（旧版叫 Book）。这个就是你的书籍项目了。
然后就可以在线写书了～书籍的在线浏览地址为：https://yourorgnizationname.gitbook.io/yourspacename

2. 在 github.com 上发布和管理书籍
在前面说的本地操作，编辑和预览书籍后，可以把 build 之后的结果，上传到 github 上面，然后利用 github pages 来发布书籍。

首先在 github 上新建一个跟你的书籍同名的 repository。
然后将远程仓库地址添加到本地，然后将编译后的 _book 目录 push 到远程。
然后在 github 上设置一下 github pages，具体方法和步骤我在另一个文章中详细介绍过：如何给github项目建立自己的主页。
在设置完后，就可以通过 https://githubusername.github.io/projectname 来浏览你的书了。

3. gitbook 与 github 关联同步
新版 gitbook.com 不支持本地版本管理了，但是对 github 的集成支持的不错。可以通过配置，实现在 github 项目里面提交内容，gitbook 平台会自动同步过去。

在 gitbook 平台里，进入要设置的 space，也就是你的书。
点左下角的配置按钮，进入配置，点击 Intergrations ，找到 github。
点击 link you github repository 按钮，根据向导，登录 github ，选择 reposirory，选择分支，完成绑定和同步。(你还可以选择是 gitbook 同步 github ，还是 github 同步 gitbook)
需要注意的是：绑定的 github 仓库分支里面要是 gitbook 的源码，也就是那些 md 文件。而不是 build 之后生成的 html 文件。
