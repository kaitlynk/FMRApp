var express = require('express');
var app = express();

var port = process.env.PORT || 8080;

app.set('view engine', 'ejs');

app.use(express.static(__dirname + '/public'));

app.get('api/getSororities', function(req, res) {
	res.send('Hello World!');
});

