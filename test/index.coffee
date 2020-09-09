#!/usr/bin/env coffee
import config from '@rmw/config'
# import {config as Xxx} from '@rmw/config'
import test from 'tape-catch'

test 'config', (t)=>
  t.equal config(1,2),3
  # t.deepEqual Xxx([1],[2]),[3]
  t.end()
