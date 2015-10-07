var express = require('express');
var router = express.Router();

router.post('/api/addSorority', function(req, res) {
	var db = req.db;
	var newSorority = req.body;
	db.collection("sororities").insert(newSorority, function(err, success) {
		if (err)
			throw err;
		else {
			res.send(success);
			db.close();
		}
	});
});


router.post('/api/removeSorority', function(req, res) {
	var db = req.db;
});


router.post('/api/updateSororities', function(req, res) {
	var db = req.db;
	var sororities = req.body;
	
	for (var i in sororities) {
		db.collection("sororities").update({_id: sororities[i]._id}, sororities[i], {upsert: true}, function(err, success) {
			if (err) 
				throw err;
		});
	}

	res.send("success");
	
});


router.post('/api/updateCalendar', function(req, res) {
	var db = req.db;
	var calendar = req.body;

	db.collection("calendar").update({_id: calendar._id}, calendar, {upsert: true}, function(err, success) {
		if (err)
			throw err;
		else {
			res.send("success");
		}
	});
	
});


router.post('/api/updateData', function(req, res) {
	var db = req.db;
	var collection = req.body.collection;
	var data = req.body.data;

	console.log(collection);
	console.log(data);

	db.collection(collection).update({_id: data._id}, data, {upsert: true}, function(err, success) {
		if (err)
			throw err;
		else {
			res.send("success");
		}
	});
	
});


module.exports = router;