$(function() {
	$("#actionErrorContainer").hide();
	$("#actionSuccessContainer").hide();
	$("#submit").on("click", function() {
		ajaxLogOut().done(function(data) {
			$("body").append(data);
		}).fail(function(xhr, status, errorThrow) {
			allert("Ajax Error :" + errorThrow);
		}).always(function(xhr, status) {
			//alert("Ajax Finished -> press f12 -> go to console tab");
		});
	})
});

function ajaxLogOut(){
	return $.ajax({
		url : "SignOut",
		type : "post",
	});
}