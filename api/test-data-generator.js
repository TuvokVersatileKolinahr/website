var mongoskin = require('mongoskin'),
    http = require('http'),
    db = mongoskin.db('mongodb://@localhost:27017/tuvok', {safe:true}),
    coll = db.collection("posts"),
    id,
    titleDone = false,
    contentDone = false,
    skelDone = false,
    date = new Date(),
    skeleton = {
      "picture": "http://lorempixel.com/g/300/200/cats/",
      "posted": date.toISOString()
    };

coll.insert(skeleton, function(e, results){
  if (e) return next(e)
  id = results[0]._id;
  console.log("inserted: ", id);
})

function getWord(text) {
  var textArray = text.split(' ');
  var word = textArray[Math.floor(Math.random() * textArray.length + 1)];

  for (;;) {
    if (typeof word == 'string') {
      break;
    }
    word = textArray[Math.floor(Math.random() * textArray.length + 1)];
  }
  // console.log("The word: ", word.replace(/\W/g, ''));
  return word.replace(/\W/g, '');
}

http.get({
  host: 'loripsum.net',
  path: '/api/1/short/plaintext'
}, function(response) {
  // Continuously update stream with data
  var body = '';
  response.on('data', function(d) {
      body += d;
  });
  response.on('end', function() {

    // Data reception is done, do whatever with it!
    console.log(body);
    coll.findById(id, function(e, result){
      if (e) return next(e)
      result.title = getWord(body) + " " + getWord(body);
      result.about = body;
      var tags = [];
      for (var i = 0; i < Math.floor(Math.random() * 7 + 1); i++) {
        tags.push(getWord(body));
      };
      result.tags = tags;
      delete result._id;
      coll.updateById(id, result, {safe: true, multi: false}, function(e, result){
        if (e) return next(e)
        console.log("result", result);
        titleDone = true
      })
    })
  });
});

http.get({
  host: 'jaspervdj.be',
  path: '/lorem-markdownum/markdown.txt'
}, function(response) {
  // Continuously update stream with data
  var body = '';
  response.on('data', function(d) {
      body += d;
  });
  response.on('end', function() {

    // Data reception is done, do whatever with it!
    console.log(body);
    coll.findById(id, function(e, result){
      if (e) return next(e)
      result.contents = body;
      delete result._id;
      coll.updateById(id, result, {safe: true, multi: false}, function(e, result){
        if (e) return next(e)
        console.log("result", result);
        contentDone = true
      })
    })
  });
});

setInterval(function() {
  if (titleDone && contentDone){
    process.exit(0);
  }
  console.log("checking ...");
}, 1000);

