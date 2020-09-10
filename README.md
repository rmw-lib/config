<!-- 本文件由 ./readme.make.md 自动生成，请不要直接修改此文件 -->

# @rmw/config

##  安装

```
yarn add @rmw/config
```

或者

```
npm install @rmw/config
```

## 使用

```
#!/usr/bin/env coffee
import * as CONFIG from '@rmw/config'
import test from 'tape-catch'

test 'config', (t)=>
  key = "user/1"
  data = {test:"12",2:11}
  CONFIG.set(key,data)
  t.deepEqual data, CONFIG.get key
  CONFIG.set(key,null)
  t.end()

```

## 关于

本项目隶属于**人民网络([rmw.link](//rmw.link))** 代码计划。

![人民网络](https://raw.githubusercontent.com/rmw-link/logo/master/rmw.red.bg.svg)
