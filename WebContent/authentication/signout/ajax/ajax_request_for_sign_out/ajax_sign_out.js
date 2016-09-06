$(function() {
	$(".signout").on("click", function() {
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
	return $.ajax({
		url : "signout",
		type : "post",
	});
}