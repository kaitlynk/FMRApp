$(document).ready(function() {

	$("label").each(function(i) {
		var currText = $(this).text();
		$(this).text(capitalizeWords(currText));
	});

	
	$("li.round:first").prev().append("<span id = 'add-round' class = 'add clickable'>[+]</span>");
	

	$(document).on("change", "select", function() {
		$(".selected-data").addClass("hidden").removeClass("selected-data");
		var newRound = $(this).val();
		console.log(newRound);
		$("#"+newRound).removeClass("hidden").addClass("selected-data");
	});


	$(document).on("click", "#save", function() {
		
		// Select all the attributes that are not Rounds
		var attributes = $(".selected-data li:not(.round)");
		var saveData = {};

		attributes.each(function(i) {
			var currKey = $(this).children("*[name=attributeName]").attr('value');
			var currValue;

			if (currKey.trim().toLowerCase() == 'rounds') {
				currValue = [];

				$(".selected-data li.round").each(function(j) {
					var currRound = {};

					$(this).children("input").each(function(k) {
						currRound[$(this).attr('name')] = $(this).val();
					});

					if (currRound.House.trim().length == 0 && currRound.Event.toLowerCase().indexOf("round") >= 0) {
						currRound.House = " ";
					} else if (currRound.Event.toLowerCase() == "lunch") {
						currRound.House = "--";
					}

					currValue.push(currRound);
				
				});
			} else {
				currValue = $(this).children("*[name=attributeValue]").val();
			}

			saveData[uncapitalizeWords(currKey)] = currValue;

		});

		var collection = $(".selected").attr('id');

		$.ajax({
			url: '/api/updateData',
			type: 'POST',
			data: JSON.stringify({collection: collection, data: saveData}),
			contentType: 'application/json',
			success: function(response) {
				var newName = $(".selected-data input.name").val();
				$("option:selected").text(newName);
				changeSaveButton();
			}
		});
	});


	$(document).on("click", "#add-round", function() {
		$(".selected-data .round:last").after("<li class = 'round'> \
				<input type = 'text' name = 'Event' value = ''>\
				<input type = 'text' name = 'Time' value = ''>\
				<input type = 'text' name = 'House' value = ''>\
				<span class = 'remove clickable'>[-]</span>\
			</li>");
	});


	$(document).on("click", "#add-attr", function() {
		var addElements = "<li> \
				<input type = 'text' name = 'attributeName' value = ''>\
				<input type = 'text' name = 'attributeValue' value = ''>\
				<span class = 'remove clickable'>[-]</span>\
			</li>";

		if ($(".selected-data .round").length > 0) {
			$(".selected-data .round-li").before(addElements);
		} else {
			$(".selected-data li:last").after(addElements);
		}
	});


	$(document).on("click", ".remove", function() {
		$(this).parent().remove();
	});



});

