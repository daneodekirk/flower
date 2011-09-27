fs   = require 'fs'
express = require 'express'

parser = require('uglify-js').parser
uglify = require('uglify-js').uglify

less   = require 'less'
lessparser = new less.Parser

{exec} = require 'child_process'

task 'layer', 'combine all coffeescript files into a single source', ->
  jsfiles = fs.readdirSync("petals").filter (file) -> /\.(coffee)$/.test file
  return console.log "there are no coffee files ./petals" if jsfiles.length is 0
  console.log "combining #{jsfiles}"
  combine jsfiles, 'app.coffee'

task 'icing', 'combine all css files into a single source', ->
  cssfiles = fs.readdirSync("petals").filter (file) -> /\.(less)$/.test file
  return console.log "there are no less files in ./petals" if cssfiles.length is 0
  console.log "combining #{cssfiles}"
  combine cssfiles, 'app.less'



task 'bake', 'Run the server', ->
  console.log 'remember the layers and icing'
  require './lib/seed'

combine = (files, name) ->
  func = if name is 'app.coffee' then process else lessify
  appcontents = new Array remaining = files.length
  for file, index in files then do (file, index) ->
    fs.readFile "petals/#{file}", 'utf8', (err, fileContents) ->
      throw err if err
      appcontents[index] = fileContents
      func appcontents, name if --remaining is 0

process = (files, name) ->
  fs.writeFile "petals/#{name}", files.join('\n\n'), 'utf8', (err) ->
    throw err if err
    exec "coffee --compile petals/#{name}", (err, stdout, stderr) ->
      console.log "Converting to javascript"
      throw err if err
      fs.unlink "petals/#{name}", (err) ->
        name = name.replace '.coffee', '.js'
        minify name
        throw err if err
        
minify = (file) ->
  min = file.replace ".js", ".min.js"
  code = fs.readFileSync('petals/app.js').toString()
  console.log "Minifying #{file} into #{min}"
  ast = parser.parse code
  compressed = uglify.gen_code uglify.ast_squeeze uglify.ast_mangle ast, extra: yes
  fs.writeFileSync "petals/#{min}", compressed
  console.log 'Javascript minified and ready'

lessify = (file, name) ->
  css = file.toString()
  parser = new less.Parser
  parser.parse css, (err, tree) ->
    throw err if err
    lesscss = tree.toCSS compress:true
    fs.writeFileSync "petals/app.css", lesscss
    console.log 'CSS minified and ready'
