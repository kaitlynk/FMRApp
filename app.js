var express = require('express');
var path = require('path');
var http = require('http');
var connect = require('connect');
var mongodb = require('mongodb');
var logger = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var requireDir = require('requiredir');
var routes = requireDir('./routes');

var app = express();
var server = app.listen(process.env.PORT || 8080);
 
app.set('views', path.join(__dirname, 'views'));
app.engine('html', require('ejs').renderFile);
app.set('view engine', 'html');

app.use(express.static(__dirname + '/public'));

app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cookieParser());

var uri = "mongodb://admin:admin@ds051863.mongolab.com:51863/heroku_bzhpj4l3";

app.use(function(req,res,next) { 
	mongodb.MongoClient.connect(uri, function(err, db) {
		if (err) throw err;
		else {
			req.db = db; 
			next();
		}
	});
});

app.use('/', routes.api);
app.use('/', routes.admin);
app.use('/', routes.index);


// catch 404 and forward to error handler
app.use(function(req, res, next) {
  var err = new Error('Not Found');
  err.status = 404;
  next(err);
});

// error handlers

// development error handler
// will print stacktrace
if (app.get('env') === 'development') {
  app.use(function(err, req, res, next) {
    res.status(err.status || 500);
    console.log(err);
    res.render('error', {
      message: err.message,
      error: err
    });
  });
}

// production error handler
// no stacktraces leaked to user
app.use(function(err, req, res, next) {
  res.status(err.status || 500);
  console.log(err);
  res.render('error.jade', {
    message: err.message,
    error: {}
  });
});


module.exports = app;