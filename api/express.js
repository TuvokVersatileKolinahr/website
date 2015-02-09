var express = require('express'),
  mongoskin = require('mongoskin'),
  bodyParser = require('body-parser')
  logger = require('morgan')

var app = express()
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({extended: true}))
app.use(logger('dev'))

var db = mongoskin.db('mongodb://@localhost:27017/tuvok', {safe:true})

app.param('collectionName', function(req, res, next, collectionName){
  req.collection = db.collection(collectionName)
  return next()
})

app.get('/', function(req, res, next) {
  res.send('please select a collection, e.g., /collections/messages')
})

app.get('/collections/:collectionName', function(req, res, next) {
  req.collection.find({}, {limit: 10, sort: {'posted': -1}}).toArray(function(e, results){
    if (e) return next(e)
    res.send(results)
  })
})

app.post('/collections/:collectionName', function(req, res, next) {
  req.collection.insert(req.body, {}, function(e, results){
    if (e) return next(e)
    res.send(results)
  })
})

app.get('/collections/:collectionName/:id', function(req, res, next) {
  var get = req.param("get");
  console.log("get", get);
  req.collection.findById(req.params.id, function(e, result01){
    if (e) return next(e)
    if (get === 'next' && result01 != null) {
      req.collection.findOne({ posted: { $gt: new Date(result01.posted) } }, {sort: {'posted': 1}}, function(e, result02){
        if (e) return next(e)
        res.send(result02)
      })
    } else if (get === 'prev' && result01 != null) {
      req.collection.findOne({ posted: { $lt: new Date(result01.posted) } }, {sort: {'posted': -1}}, function(e, result02){
        if (e) return next(e)
        res.send(result02)
      })
    } else {
      res.send(result01)
    }
  })
})

// app.put('/collections/:collectionName/:id', function(req, res, next) {
//   req.collection.findById(req.params.id, function(e, result){
//     if (e) return next(e)
//     console.log("result", result);
//   })
// })
app.put('/collections/:collectionName/:id', function(req, res, next) {
  delete req.body._id;
  req.collection.updateById(req.params.id, {$set: req.body}, {safe: true, multi: false}, function(e, result){
    if (e) return next(e)
    res.send((result === 1) ? {msg:'success'} : {msg: 'error'})
  })
})

app.delete('/collections/:collectionName/:id', function(req, res, next) {
  req.collection.removeById(req.params.id, function(e, result){
    if (e) return next(e)
    res.send((result === 1)?{msg: 'success'} : {msg: 'error'})
  })
})

app.listen(9860, function(){
  console.log('Express server listening on port 9860')
})

