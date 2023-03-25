# 宇信vue-yu前端

## 样式编码

用el-ui套yu-ui的壳，主题还是el-ui

### 组件

- bug
  - 缺失yufp
    - 原因
      - 组件中缺失必须组件yufp
    - 解决
      - 使用provide引入 provide () { return { yufp: window.tymh.yufp } }
