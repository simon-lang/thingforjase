fs = require 'fs'
express = require 'express'
request = require 'request'

app = express()
app.use express.static __dirname + '/www'

app.get '/image', (req, res) ->
  console.log 'request for images:'
  console.log 'requesting', req.param('image1')
  request(req.param('image1')).pipe(fs.createWriteStream('image1.jpg')).on 'finish', ->
    console.log 'requesting', req.param('image2')
    request(req.param('image2')).pipe(fs.createWriteStream('image2.png')).on 'finish', ->
      res.send 'cool runnings'

app.listen '3001'
