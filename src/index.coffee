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
      @get(obj, prop)
      obj[prop] = value
      filepath = obj.__filename
      delete obj.__filename
      mkdirSync(dirname(filepath), recursive:true)
      writeFileSync(
        filepath
        YAML.stringify obj
      )
      obj.__filename = filepath

    get:(obj, prop)=>
      filepath = ENV.CONFIG+".yml"
      if not obj.__filename
        obj.__filename = filepath
        if existsSync(filepath)
          data = readFileSync(filepath, 'utf8')
          config = YAML.parse(data) or {}
          Object.assign obj, config
      return obj[prop]
  }
)
