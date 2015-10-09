var express = require('express');
var router = express.Router();

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


module.exports = router;