#!/usr/bin/env coffee
import CONFIG from '@rmw/config'
import test from 'tape-catch'

test 'config', (t)=>
  console.log CONFIG.xxx
  CONFIG.xxx = 52
  t.end()
