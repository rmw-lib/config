#!/usr/bin/env coffee

import {Env} from '@rmw/env'
import YAML from 'yaml'
import {dirname, join} from 'path'
import {existsSync, readFileSync,writeFileSync,mkdirSync,unlinkSync} from 'fs'

ENV = Env(2)

export default new Proxy(
  {}
  {
    set:(obj, prop, value)->
      filepath = ENV.config+".yml"
      if not (filepath of obj)
        @get(obj, prop)
      o = obj[filepath]
      o[prop] = value
      mkdirSync(dirname(filepath), recursive:true)
      writeFileSync(
        filepath
        YAML.stringify o
      )
      return value

    get:(obj, prop)=>
      filepath = ENV.config+".yml"
      o = obj[filepath]
      if not o
        if existsSync(filepath)
          data = readFileSync(filepath, 'utf8')
          o = YAML.parse(data) or {}
        else
          o = {}
        obj[filepath] = o
      return o[prop]
  }
)
