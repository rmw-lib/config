#!/usr/bin/env coffee

import {Env} from '@rmw/env'
import YAML from 'yaml'
import {dirname, join} from 'path'
import {existsSync, readFileSync,writeFileSync,mkdirSync, unlinkSync} from 'fs'

ENV = Env(1)

export set = (filepath, data)=>
  if data == undefined
    filepath = undefined
    data = filepath
  filepath = _filepath filepath
  if data == null
    if existsSync(filepath)
      unlinkSync(filepath)
  else
    mkdirSync(dirname(filepath), recursive:true)
    out = YAML.stringify data
    writeFileSync(
      filepath
      out
    )

_filepath = (filepath)=>
  if not filepath
    filepath = ENV.CONFIG
  else
    filepath = join ENV.CONFIG,filepath
  filepath+".yml"

export get = (filepath)=>
  filepath = _filepath filepath
  if existsSync(filepath)
    data = readFileSync(filepath, 'utf8')
    return YAML.parse data
  return {}
