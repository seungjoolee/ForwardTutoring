var SelectFile = function() {
	$("#link-group").hide();
	$("#select-link").removeClass("active");
	$("#file-group").show();
	$("#select-file").addClass("active");

	$("#is_file").val(true);	
}

var SelectLink = function() {
	$("#file-group").hide();
	$("#select-file").removeClass("active");
	$("#link-group").show();
	$("#select-link").addClass("active");

	$("#is_file").val(false);
}


$(".submit-buttons").show();
if (resourceHash.link.length > 0) {
	SelectLink();
} else {
	SelectFile();
}