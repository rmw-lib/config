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
      filepath = ENV.config
      yml = filepath+".yml"
      if not (filepath of obj)
        @get(obj, prop)
      o = obj[filepath]
      if value == o[prop]
        return value
      o[prop] = value
      mkdirSync(dirname(filepath), recursive:true)
      writeFileSync(
        yml
        YAML.stringify o
      )
      return value

    get:(obj, prop)=>
      filepath = ENV.config
      o = obj[filepath]
      if not o
        yml = filepath+".yml"
        if existsSync(yml)
          o = YAML.parse(
            readFileSync(yml, 'utf8')
          ) or {}
        else
          o = {}
        obj[filepath] = o
      return o[prop]
  }
)
