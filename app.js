var express = require('express');
var http = require('http');
var connect = require('connect'),
	mongojs = require('mongojs');
var mongodb = require('mongodb');
var logger = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');

var app = express();
var server = app.listen(process.env.PORT || 8080);
 
app.set('view engine', 'ejs');

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


// Sorority Info
app.get('/api/getSororityNames', function(req, res) {
	var db = req.db;
	db.collection("sororities").find({}, {name: 1, _id: 0}).toArray(function(err, sororities) {
		if (err)
			throw err;
		else {
			var sororityArray = [];
			for (var s in sororities)
				sororityArray.push(sororities[s].name);
			
			res.send(sororityArray);
			db.close();
		}
	});
});

app.get('/api/getSororities', function(req, res) {
	var db = req.db;
	var sororitiesCollection = db.collection("sororities");
	sororitiesCollection.find({}).toArray(function(err, sororities) {
		if (err)
			throw err;
		else {
			res.send(sororities);
			db.close();
		}
	});
});


// Sorority Info
app.get('/api/getSororitiesDict', function(req, res) {
	var db = req.db;
	db.collection("sororities").find({}, {_id: 0}).toArray(function(err, sororities) {
		if (err)
			throw err;
		else {
			var sororityDict = {};
			for (var s in sororities)
				sororityDict[sororities[s].name] = sororities[s];
			
			res.send(sororityDict);
			db.close();
		}
	});
});


app.get('/api/getInfo', function(req, res) {
	var db = req.db;
	db.collection("info").find({}, {_id: 0}).toArray(function(err, categories) {
		if (err) throw err;
		else {
			var info = [];

			var infoCategories = [];
			var infoDescriptions = [];
			var infoDetails = {};

			for (var i in categories) {
				if (categories[i].name == "Descriptions") {
					for (var j in categories[i].info) {
						infoCategories = infoCategories.concat(Object.keys(categories[i]["info"][j]));
						infoDescriptions.push(categories[i]["info"][j][Object.keys(categories[i]["info"][j])]);
					}
					
				} else {
					infoDetails[categories[i].name] = categories[i].info;
				}
			}

			info.push(infoCategories);
			info.push(infoDescriptions);
			info.push(infoDetails);

			res.send(info);
			db.close();
		}
	});
});

app.get('/api/getInfoCategories', function(req, res) {
	var db = req.db;
	db.collection("info").find({name: "Descriptions"}, {_id: 0, info: 1}).toArray(function(err, categories) {
		if (err) throw err;
		else {
			res.send(categories[0].info);
			db.close();
		}
	});
});

app.post('/api/addSorority', function(req, res) {

});

app.get('*', function(req, res) {
	
});

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