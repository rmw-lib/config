#!/usr/bin/env coffee

import {Env} from '@rmw/env'
import YAML from 'yaml'
import {dirname, join} from 'path'
import {existsSync, readFileSync,writeFileSync,mkdirSync} from 'fs'

ENV = Env(1)

export set = (filepath, data)=>
  filepath = join ENV.CONFIG,filepath+".yml"
  dirpath = dirname filepath
  mkdirSync(dirpath, recursive:true)
  out = YAML.stringify data
  writeFileSync(
    filepath
    out
  )

export get = (filepath)=>
  filepath = join ENV.CONFIG,filepath+".yml"
  if existsSync(filepath)
    data = readFileSync(filepath, 'utf8')
    return YAML.parse data
  return {}
