var express = require('express');
var router = express.Router();

function capitalize(str) {
	return str.charAt(0).toUpperCase() + str.substr(1, str.length);
}

router.get('/:collection', function(req, res) {
	var db = req.db;
	var params = req.params;

	db.collection(params.collection).find({}).sort({_id: 1}).toArray(function(err, data) {
		if (err)
			throw err;
		else {
			res.render('calendar', {collection: params.collection, data: data});
		}
	});
	
});


router.get('/info', function(req, res) {
	var db = req.db;
	db.collection("sororities").find({}).sort({name: 1}).toArray(function(err, sororities) {
		if (err)
			throw err;
		else {
			res.render('info', {sororities: sororities});
		}
	});
	
});


router.get('*', function(req, res) {
	var db = req.db;
	db.collection("sororities").find({}).sort({name: 1}).toArray(function(err, sororities) {
		if (err)
			throw err;
		else {
			res.render('sororities', {sororities: sororities});
		}
	});
	
});

module.exports = router;