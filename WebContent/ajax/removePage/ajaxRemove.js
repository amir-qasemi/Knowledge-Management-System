$(function() {
	$("#actionErrorContainer").hide();
	$("#actionSuccessContainer").hide();
	$("#submit").on("click", function() {
		ajaxlogin().done(function(data) {
			$("body").append(data);
		}).fail(function(xhr, status, errorThrow) {
			allert("Ajax Error :" + errorThrow);
		}).always(function(xhr, status) {
			//alert("Ajax Finished -> press f12 -> go to console tab");
		});
	})
});

function ajaxlogin() {
	var dynamicdata = {};
	dynamicdata["userName"] = $("#userName").val();
	return $.ajax({
		url : "Remove",
		type : "post",
		data : dynamicdata
	});
}