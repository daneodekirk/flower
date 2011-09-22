express = require 'express'
app = express.createServer()

oneWeek = 2629743
app.set 'view options', { layout : false }
app.set 'view engine', 'coffee'
app.register '.coffee', require('coffeekup').adapters.express

app.use express.static "#{__dirname}/petals", { maxAge: oneWeek }
app.use express.errorHandler()
app.use express.compiler { src:"#{__dirname}/petals", enable: ['less', 'coffeescript'] }

app.get '/', (request, response) ->
  response.render 'index', foo: 'bar'


app.listen 1123
console.log "Server running on port #{app.address().port}"
