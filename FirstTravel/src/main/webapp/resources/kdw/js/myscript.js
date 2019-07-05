/**
 * 
 */

function isImage(fileName) {
	var dotIndex = fileName.lastIndexOf(".");
	var formatType = fileName.substring(dotIndex + 1).toLowerCase();
	console.log("formatType: " + formatType);
	if (formatType == "jpg" || formatType == "png" || formatType == "gif") {
		return true;
	}
	return false;
}