fs   = require 'fs'
express = require 'express'

{exec} = require 'child_process'

task 'layer', 'combine all coffeescript files into a single source', ->
  jsfiles = fs.readdirSync("petals").filter (file) -> /\.(coffee)$/.test file
  return console.log "there are no coffee files ./petals" if jsfiles.length is 0
  console.log "combining #{jsfiles}"
  combine jsfiles, 'app.coffee'

# [TODO] combining less files may be counter productive
task 'icing', 'combine all css files into a single source', ->
  cssfiles = fs.readdirSync("petals").filter (file) -> /\.(less)$/.test file
  return console.log "there are no less files in ./petals" if cssfiles.length is 0
  console.log "combining #{cssfiles}"
  combine cssfiles, 'app.less'

task 'bake', 'Run the server', ->
  invoke 'layer'
  invoke 'icing'
  require './lib/seed'

combine = (files, name) ->
  appcontents = new Array remaining = files.length
  for file, index in files then do (file, index) ->
    fs.readFile "petals/#{file}", 'utf8', (err, fileContents) ->
      throw err if err
      appcontents[index] = fileContents
      process appcontents, name if --remaining is 0

process = (files, name) ->
  fs.writeFile "petals/#{name}", files.join('\n\n'), 'utf8', (err) ->
    throw err if err
    console.log 'Done'
