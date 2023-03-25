# vue


## 环境准备


## 启动命令

npm run {环境名}


### dom

#### 插槽

##### 默认

##### 具名
父
```html
<><>

```

##### 作用域


## 包

1. 打印
   1. lodop
2. 合并数组对象
   1. lodash

## vue2

### api


#### 杂项

1. el的2种写法
   1. .new Vue的时候配置el属性
   2. 先创建Vue实例，随后再通过vm.$mount('#root')指定el的值
2. data的2种写法
   1. 对象式
   2. 函数式
   3. 组件的时候，data必须使用函数式
3. 重要原则
   1. 由Vue管理的函数，一定不要写箭头函数，不然this就不指向Vue实例了


#### 组件

1. vue中使用组件的三大步骤
   1. 定义组件
   2. 注册组件
   3. 使用组件（写组件标签）
2. 如何定义组件
   1. 使用Vue.extend(options)创建，其中options和new Vue(options)时传入的那个options几乎一样，但也有点区别，区别为
      1. el不要写
         1. 最终所有的组件都要经过一个vm的管理，由vm中的el决定服务哪个容器
      2. data必须写成函数
         1. 避免组件被复用时，数据存在引用关系
      3. 使用template可以配置组件结构
3. 如何注册组件
   1. 局部注册:靠new Vue的时候传入components选项
   2. 全局注册:靠Vue.component('组件名',组件)
4. 编写组件标签
   1. '\<school></school\>'
5. 注意点
   1. 关于组件名
      1. 一个单词组成
         1. 第一种写法，首字母小写：school
         2. 第二种写法，首字母大写：School
      2. 多单词组成
         1. 第一种写法（kebab-case命名）：my-school
         2. 第二种写法（CamelCase命名）：MySchool（需要Vue脚手架支持）
      3. 备注
         1. 组件名尽可能回避HTML中已有的元素名称，例如：H2，h2
         2. 可以使用name配置项指定组件在开发者工具中呈现的名字
   2. 关于组件标签
      1. 第一种写法 ： \<school>\</schoole>
      2. 第二种写法：\<school/>
      3. 不用使用脚手架时，\<school/>会导致后续组件不能渲染
   3. 一个简写方式
      1. const school = Vue.extend(options) 可简写为：const school = options
6. 关于VueComponent
   1. school组件本质是

#### 选项/数据

1. data
2. props
3. propsData
4. computed
5. methods
6. watch

#### 选项/DOM

1. el
2. template
3. render
4. renderError

#### 全局配置

1. silent
2. optionMergeStrategies
3. devtools
4. errorHandler
5. warnHandler
6. ignoredElements
7. keyCodes
8. performance
9. productionTip

#### 全局api

1. .extend(options)
2. .nextTick([callback, context])
3. .set(object, key, value)
4. .delete(object, key)
5. .directive(id, [definition])
6. .filter(id, [definition])
7. .component(id, [definition])
8. .use(plugin)
9. .mixin(mixin)
10. .compile(template)
11. .observable
12. .version

#### 数据

1. data
2. props
3. propsData
4. computed
5. methods
6. watch

#### 选项/DOM

1. el
2. template
3. render

#### 选项/生命周期钩子

1. beforeCreate
2. created
3. beforeMount
4. mounted
5. beforeUpdate
6. updated
7. activated
8. deactivated
9. beforeDestroy
10. destroyed
11. errorCaptured

#### 选项/资源

1. directives
2. filters
3. components

#### 选项/组合

1. parent
2. mixins
   1. 写法
3. extends
4. provide/inject

#### 选项/杂项

1. parent
2. mixins
3. name
4. extends
5. delimiters
6. functional


#### 选项/其他

1. name
2. delimiters
3. functional
4. model
5. inheritAttrs
6. comments

#### 实例属性

1. vm.$data
2. vm.$props
3. vm.$el
4. vm.$options
5. vm.$parent
6. vm.$root
7. vm.$children
8. vm.$slots
9. vm.$scopedSlots
10. vm.$refs
11. vm.$isServer
12. vm.$attrs
13. vm.$listeners

#### 实例方法/数据

1. vm.$watch(expOrFn, callback, [options])
2. vm.$set(object, key, value)
3. vm.$delete(object, key)

#### 实例方法/事件

1. vm.$on(event, callback)
2. vm.$once(event, callback)
3. vm.$off([event, callback])
4. vm.$emit(event, [...args])

#### 实例方法/生命周期

1. vm.$mount([elementOrSelector])
2. vm.$forceUpdate()
3. vm.$nextTick([callback])
4. vm.$destroy()

#### 指令
1. v-text
2. v-html
3. v-show
4. v-if
5. v-else
6. v-else-if
7. v-for
8. v-on
    1. v-on:click 事件
    2. 简写
        1. @click
            1. 传参
               1. @click="function"
               2. @click="function(a, $event)"
        2. 修饰符
            1. .prevent
                1. 阻止默认事件(常用)
            2. .stop
               1. 阻止事件冒泡(常用)
            3. .once
               1. 事件只触发一次(常用)
            4. .capture
               1. 使用事件的捕获模式
            5. .self
               1. 只有event.target是当前操作的元素时才触发事件
            6. .passive
               1. 时间的默认行为立即执行,无需等待事件回调执行完毕
        3. 键盘事件
            1. .keyup
                1. 默认事件
                2. 使用keyCode去指定具体的按键（不推荐）
                3. Vue.config.keyCode.自定义键名 = 键码  可以去定制按键别名
                4. .enter
                   1. 确认
                5. .esc
                   1. 退出
                6. .space
                   1. 空格
                7. .tab
                   1. 换行
                   2. 配合keydown使用
                8. .up
                   1. 上
                9. .down
                   1. 下
                10. .left
                   2. 左
                11. .right
                   3. 右
    3. this 是指 vm对象
9.  v-bind
10. v-model
11. v-solt
12. v-pre
13. v-cloak
14. v-once

#### 特殊attribute

1. key
2. ref
3. is
4. Slot
5. Slot-scope
6. scope

#### 内置组件

1. component
2. transition
3. transition-group
4. keep-alive
5. slot
#### 计算属性

1. 定义：要用的属性不存在，要通过已有属性计算得来
2. 原理：底层借助了Object.defineproperty方法提供的getter和setter
3. 优势：与methods实现相比，内部有缓存机制（复用），效率更高，调试方便。
4. 注意：
   1. 如果计算属性要被修改，那必须写set函数去响应修改，且set中要引起计算时依赖的数据发生改变

```js
computed: {
   fullName: {
      // 当读取fullName时，get就被调用，并且返回值被当做fullname的值
      // get调用时机：1.初次读取fullname时，2.所依赖的数据发生变化时
      get(){
         this // vm对象
         return 
      }
      set(){

      }
   }
}
```

简写:只考虑读取不考虑改写

```js
computed:{
   fullName(){
      return 777;
   }
}
```

#### 监视属性

1. 通用
   1. 当监视的属性变化时，回调函数会自动调用，进行相关操作
   2. 监视的属性必须存在，才能进行监视
   3. 监视的两种写法
      1. new Vue时传入watch配置
      2. 通过vm.$watch监视
2. 深度监视
   1. vue中的watch默认部监测对象内部值的改变（一层）
   2. 配置deep:true可以监测对象内部值改变（多层）
   3. 备注
      1. vue自身可以监测对象内部值的改变，但vue提供的watch默认不开启
      2. 使用watch时根据数据的具体结构，决定是否采用深度监视


```js
watch:{
   beWatch:{      // 被监视变量
      deep:true,  // 深度监视
   }
}

```

#### 特殊元素

1. key
2. ref
3. slot

#### 内置组件

1. component
2. transition
3. transition-group
4. keep-alive
5. slot

### 响应式原理
重写数组的一系列方法实现数据拦截
> get() set()
存在问题
> 新增删除属性，界面不会更新
> 直接通过下标修改，不会更新

this.$set()
Vue.set()

this.$delete(this.param, '属性');
Vue.delete();

## vue3

### 库函数
ref -- 数据的响应式实现
reactive -- 响应式函数
proxy

### setup

### 响应式原理