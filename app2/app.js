var express = require('express');
var app = express();

app.get('/', function (req, res) {
  res.send('<body style="background-color: yellow; text-align: center; padding-top: 200px;"><h1>Hello from App 2!</h1></body>');
});

var server = app.listen(5000, function () {
  var host = server.address().address;
  var port = server.address().port;

  console.log('Example app listening at port 5000');
});
