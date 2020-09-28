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
      filepath = ENV.CONFIG+".yml"
      if filepath of o
        @get(obj, prop)
      o = obj[filepath]
      o[prop] = value
      mkdirSync(dirname(filepath), recursive:true)
      writeFileSync(
        filepath
        YAML.stringify o
      )

    get:(obj, prop)=>
      filepath = ENV.CONFIG+".yml"
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
