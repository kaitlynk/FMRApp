$(document).ready(function() {

	$("ul:first li input").each(function(i) {
		var currText = $(this).val();
		$(this).val(capitalizeWords(currText));
	});

	$(document).on("click", "#save", function() {
		var categories = [];
		var sororities = [];

		$("ul").each(function(i) {
			var currSorority = {};

			$(this).find("input").each(function(j) {
				// If this is the category column
				
				if (i == 0) {
					categories.push(uncapitalizeWords($(this).val()));
				} else {
					currSorority[categories[j]] = $(this).val();
				}
			});

			if (i > 0)
				sororities.push(currSorority);
		});

		console.log(sororities);

		$.ajax({
			url: '/api/updateSororities',
			type: 'POST',
			data: JSON.stringify(sororities),
			contentType: 'application/json',
			success: function(response) {
				changeSaveButton();
			}
		});
	});

});
