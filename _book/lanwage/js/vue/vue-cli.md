# vue-cli


## 安装

npm install webpack -g | npm install webpack webpack-cli -g

npm install --global vue-cli


## 问题

1. 安装后无法找到vue命令

node自定义安装在非d盘:
> 查看 npm root -g
> npm config set prefix {node目录路径}
zh

## 认识

### 文件结构


### 不同版本vue


### vue.config.js配置文件


### ref属性


### 配置项props

1. 写法
      1. 简单
         1. props['name', 'username']
      2. 对数据进行验证
         1. ```js    props: { name: String, age: Number } ```
      3. 完整
         1. ```js  props:{ name: { type:String, required: true, default: 99 } }  ```
   2. 备注
      1. props是只读的，Vue底层会检测对props的修改，如果进行了修改，就会发出警告，若业务需求确实需要修改，那么请复制props的内容到data中一份，然后去修改data中的数据

### 透传attributes

指的是传递给一个组件，却没有被该组件声明为 props 或 emits 的 attribute 或者 v-on 事件监听器。最常见的例子就是 class、style 和 id。

1. 如果一个子组件的根元素已经有了 class 或 style attribute，它会和从父组件上继承的值合并

### mixin(混入)

1. 功能
   1. 可以把多个组件共用的配置提取成一个混入对象
2. 使用方式
   1. 第一步，定义
      1. ```  {  ```
      2. ```     data(){...} ```
      3. ```     methods: {...}     ```
      4. ```     ...  ```
      5. ```   }  ```
   2. 第二步，使用
      1. 全局：Vue.mixin(xxx)
      2. 局部：mixins:['xxx']4 


### VueComponent

1. school组件本质是一个名为VueComponent的构造函数，且不是程序员定义的，是Vue.extend生成的
2. 我们只需要写<school/>或<school></school>,Vue解析时会帮我们创建school组件的实例,即Vue帮我们执行的：new VueComponent(options)
3. 特别注意:每次调用Vue.extend。返回的都是一个全新的VueComponent
4. 关于this指向:
   1. 组件配置中:
      1. data函数，method中的函数，watch中的函数，computed中的函数 它们的this均是[VueComponent实例对象]
   2. new Vue(options)配置中
      1. data函数，method中的函数，watch中的函数，computed中的函数 它们的this均是[Vue实例对象]
5. VueComponent的实例对象，以后简称vc（也可称之为：组件实例对象）
6. 重要的内置关系
   1. 一个重要的内置关系:VueComponent.prototype.__proto__ === Vue.prototype
   2. 这层关系的意义
      1. 让组件实例对象(vc)可以访问到Vue原型上的属性，方法


### 暴露组件

1. export default 组件名
   1. 默认暴露
   2. 引入方式
      1. import ??? from ???
2. export
   1. 分别暴露
   2. 引入方式
      1. import {???} from ???
3. export {组件名}
   1. 统一暴露
   2. 引入方式
      1. import {???} from ???

### 插件

1. 功能
   1. 用于增强Vue
2. 本质
   1. 包含install方法的一个对象，install的第一个参数是Vue，第二个以后的参数是插件使用者传递的数据
3. 定义插件
   1. 对象.install = function (Vue, options) {}
   2. 添加实例方法
      1. Vue.prototype.$myMethod = function () {...}
      2. Vue.prototype.$myProperty = xxx
4. 使用插件
   1. Vue.use()


### scoped样式

1. 作用
   1. 让样式在局部生效，防止冲突
2. 写法
   1. <style scoped>


### 组件的自定义事件

1. 一种组件间通信的方式，适用于：子组件 ===> 父组件
2. 使用场景：A是父组件，B是子组件，B想给A传数据，那么就要在A中给B绑定自定义事件(事件的回调在A中)
3. 绑定自定义事件：
   1. 第一种方式，在父组件中：<Demo @atguigu="test"/> 或 <Demo v-on:atguigu="test"/>
   2. 第二种方式，在父组件中：
   ```html
      <Demo ref="demo"/>
      -----
      mounted(){
         this.$refs.xxx.$on('atguigu', this.test)
      }
   ```
   3. 若想让自定义事件只能触发一次，可以使用once修饰符,或$once方法
4. 触发自定义事件：this.$emit('atgugui', 数据)
5. 解绑自定义事件 this.$refs('atguigu')
6. 组件上也可以绑定原生DOM事件，需要使用native修饰符
7. 注意：通过 this.$refs.xxx.$on('atguigu', 回调) 绑定自定义事件时，回调 要么配置在methods中，要么用箭头函数，否则this指向会出问题


### 全事件总线(GlobalEventBus)

1. 一种组件间通信的方式，适用于 ##任意组件间通信##
2. 安装全局时间总线
```js
new Vue ({
   ...
   beforeCreate() {
      Vue.prototype.$bus = this  // 安装全局事件总线，$bus就是当前应用的vue
   },
   ...
})
```
3. 使用事件总线
   1. 接收数据：A组件想接收数据，则在A组件中给$bus绑定自定义事件，事件的 ##回调留在A组件自身##
```js
   method() {
      demo(data) {...}
   },
   ...
   mounted() {
      this.$bus.$on('xxx', this.demo)
   }
```
   2. 提供数据：this.$bus.$emit('xxx', 数据)
4. 最好在beforeDestroy钩子中，用$off去解绑 ##当前组件所用到的## 事件

### 消息订阅与发布(pubsub)

1. 一种组件间通信的方式，适用于 ##任意组件间通信##
2. 使用步骤
   1. 安装pubsub: npm i pubsub.js
   2. 引入: import pubsub from 'pubsub.js'
   3. 接收数据: A组件想接收数据，则在A组件中订阅消息,订阅的 ##回调留在A组件自身##
```js
method() {
   demo(data) {...}
}
...
mounted() {
   this.pid = pubsub.subscribe('xxx', this.demo) // 订阅消息
}
```
   4. 提供数据： pubsub.publish('xxx', 数据)
   5. 最好在beforeDestroy钩子中，用PubSub.unsubscribe(pid)去 ##取消订阅##


### nextTick

1. 语法： this.$nextTick(回调函数)
2. 作用：在下一次DOM更新结束后执行其指定的回调
3. 什么时候用：当改变数据后，要基于更新后的新DOM进行某些操作时，要在nextTick所指定的回调函数中执行

### 插槽

1. 作用
   1. 让父组件可以向子组件指定的位置插入html结构，也是一种组件间通信的方式，适用于 ##父组件===>子组件##
2. 使用方式
   1. 默认插槽
```js
父组件中，
   <Category>
      <div>html结构1</div>
   </Category>
子组件中
   <template>
      <div>
         <!-- 定义插槽 -->
         <slot>插槽默认内容...</slot>
      </div>
   </template>
```
   2. 具名插槽
```js
父组件中，
   <Category>
      <template slot="center">
         <div>html结构1</div>
      </template>
      <template v-slot:footer>
         <div>html结构1</div>
      </template>
   </Category>
子组件中
   <template>
      <div>
         <!-- 定义插槽 -->
         <slot name="center">插槽默认内容...</slot>
         <slot name="footer">插槽默认内容...</slot>
      </div>
   </template>
```
   3. 作用域插槽
      1. 理解： ##数据在组件的自身，但根据数据生成的结构需要使用者来决定## . (games数据在Category组件中，但使用数据所遍历出来的结构由App组件决定)
      2. 具体编码：
```js
父组件中，
   <Category>
      <template scope="scopeData">
         <!-- 生成的是ul列表 -->
         <ul>
            <li v-for="g in scopeData.games" :key="g" >{{g}}</li>
         </ul>
      </template>

      <template scope="scopeData">
         <!-- 生成的是h4标题 -->
         <h4 v-for="g in scopeData.games" :key="g" >{{g}}</h4>
      </template>
   </Category>
子组件中
   <template>
      <div>
         <!-- 定义插槽 -->
         <slot :games="games" ></slot>
      </div>
   </template>
```

### 杂项

#### 关于不同版本的vue

1. vue.js与vue.runtime.xxx.js的区别
   1. vue.js是完整版的Vue,包含：核心功能+模版解析器
   2. vue.runtime.xxx.js是运行版的Vue，只包含：核心功能，没有模版解析器
2. 因为vue.runtime.xxx.js没有模版解析器，所以不能使用template配置项，需要使用render函数接收到的createElement函数去指定具体内容

