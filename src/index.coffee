#!/usr/bin/env coffee

import {Env} from '@rmw/env'
import YAML from 'yaml'
import {dirname, join} from 'path'
import {existsSync, readFileSync,writeFileSync,mkdirSync,unlinkSync} from 'fs'

ENV = Env(1)

_filepath = (filepath)=>
  if filepath
    filepath = join ENV.CONFIG,filepath
  else
    filepath = ENV.CONFIG
  filepath+".yml"

export set = (filepath, data)=>
  if data == undefined
    data = filepath
    filepath = undefined
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

export get = (filepath)=>
  filepath = _filepath filepath
  if existsSync(filepath)
    data = readFileSync(filepath, 'utf8')
    return YAML.parse data
  return {}
