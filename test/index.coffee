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
