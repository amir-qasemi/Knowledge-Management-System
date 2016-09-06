$(function() {
	$("#actionErrorContainer").hide();
	$("#actionSuccessContainer").hide();
	$("#register").on("click", function() {
		ajax1Registration().done(function(data) {
			$("body").append(data);
		}).fail(function(xhr, status, errorThrow) {
			allert("Ajax Error :" + errorThrow);
		}).always(function(xhr, status) {
			// alert("Ajax Finished -> press f12 -> go to console tab");
		});
	});
});

function ajax1Registration() {
	var dynamicdata = {};
	dynamicdata["userName"] = $("#userName").val();
	dynamicdata["password"] = $("#password").val();
	dynamicdata["email"] = $("#email").val();
	dynamicdata["confirmPassword"] = $("#confirmPassword").val();
	return $.ajax({
		url : "signup",
		type : "post",
		data : dynamicdata
	});
}