var express = require('express');
var router = express.Router();

// Sorority Info
router.get('/api/getSororityNames', function(req, res) {
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

router.get('/api/getSororities', function(req, res) {
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


router.get('/api/getSororitiesDict', function(req, res) {
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


router.get('/api/getInfo', function(req, res) {
	var db = req.db;
	db.collection("info").find({}, {_id: 0}).toArray(function(err, categories) {
		if (err) throw err;
		else {
			var info = [];

			var infoCategories = [];
			var infoDescriptions = {};
			var infoDetails = {};

			for (var i in categories) {
				if (categories[i].name == "Descriptions") {
					infoDescriptions = categories[i].info;
				} else {
					infoDetails[categories[i].name] = categories[i].info;
				}
			}

			info.push(infoDescriptions);
			info.push(infoDetails);

			res.send(info);
			db.close();
		}
	});
});

router.get('/api/getInfoCategories', function(req, res) {
	var db = req.db;
	db.collection("info").find({name: "Descriptions"}, {_id: 0, info: 1}).toArray(function(err, categories) {
		if (err) throw err;
		else {
			res.send(categories[0].info);
			db.close();
		}
	});
});

router.get('/api/getCalendar', function(req, res) {
	var db = req.db;
	db.collection("calendar").find({}, {_id:0}).toArray(function(err, calendar) {
		if (err) throw err;
		else {
			res.send(calendar);
			db.close();
		}
	});
});

module.exports = router;