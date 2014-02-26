$(document).ready(function(){ 
	var SelectFile = function() {
		$("#link-group").hide();
		$("#select-link").removeClass("active");
		$("#file-group").show();
		$("#select-file").addClass("active");
		$(".submit-buttons").show();
	}

	var SelectLink = function() {
		$("#file-group").hide();
		$("#select-file").removeClass("active");
		$("#link-group").show();
		$("#select-link").addClass("active");
		$(".submit-buttons").show();
	}
	console.log("ADW");
	$("#resource_topic_id").chosen();
});