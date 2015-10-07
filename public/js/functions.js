function capitalize(str) {
	return str.charAt(0).toUpperCase() + str.substr(1, str.length);
}

function capitalizeWords(str) {
	strArray = str.split(" ");
	for (var word in strArray) {
		strArray[word] = capitalize(strArray[word]);
	}

	return strArray.join(" ");
}

function uncapitalizeWords(str) {
	strArray = str.split(" ");
	for (var word in strArray) {
		strArray[word] = uncapitalize(strArray[word]).trim();
	}
	return strArray.join(" ");
}

function uncapitalize(str) {
	return str.charAt(0).toLowerCase() + str.substr(1, str.length);
}

function changeSaveButton() {
	$("#save").val("Saved!");
	setTimeout(function(){ $("#save").val("Save"); }, 1500);	
}
