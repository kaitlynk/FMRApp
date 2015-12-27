var express = require('express');
var router = express.Router();
var cloudinary = require('cloudinary');

router.post('/api/updateData', function(req, res) {
	var db = req.db;
	var collection = req.body.collection;
	var data = req.body.data;

	db.collection(collection).update({_id: data._id}, data, {upsert: true}, function(err, success) {
		if (err)
			throw err;
		else {
			res.send("success");
		}
	});
	
});

router.post('/api/uploadPhoto', function(req, res) {
	var db = req.db;
	
});


module.exports = router;