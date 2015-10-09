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
			var respData = [];

			if (params.collection == 'info') {
				
				for (var i in data) {
					var tempData = {};
					tempData.name = data[i].name;
					tempData._id = data[i]._id;

					for (var j in data[i].info) {
						var nextJ = parseInt(j) + 1;
						var key = (data[i]["info"][j].title in tempData) ? nextJ + ". " + data[i]["info"][j].title : data[i]["info"][j].title;
						tempData[key] = data[i]["info"][j].desc;
					}

					respData.push(tempData);
				}

			} else
				respData = data;

			res.render('index', {collection: params.collection, data: respData});
		}
	});
	
});


router.get('*', function(req, res) {
	res.redirect('/sororities');
});

module.exports = router;