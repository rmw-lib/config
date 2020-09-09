#!/usr/bin/env coffee

import DIR_CONFIG from '@rmw/env/dir/config'
import YAML from 'yaml'
import {dirname, join} from 'path'
import {existsSync, readFileSync,writeFileSync,mkdirSync} from 'fs'

export set = (filepath, data)=>
  filepath = join DIR_CONFIG,filepath+".yml"
  dirpath = dirname filepath
  mkdirSync(dirpath, recursive:true)
  out = YAML.stringify data
  writeFileSync(
    filepath
    out
  )

export get = (filepath)=>
  filepath = join DIR_CONFIG,filepath+".yml"
  if existsSync(filepath)
    data = readFileSync(filepath, 'utf8')
    YAML.parse data
  return {}
