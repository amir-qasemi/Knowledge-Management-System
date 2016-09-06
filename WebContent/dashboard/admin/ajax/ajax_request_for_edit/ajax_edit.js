$(function() {
	$("#home-pills").hide();
	$(".editButtons").on("click", function() {
		var a = $(this).parent().siblings(".userName").html();
		$(".userNames").val(a);
		$(".EditeSubmit").click();
	});
	$(".closeTheModal").on("click", function() {
		window.location.href = "seeList";
	});
	$(".banButton").on("click", function() {
		var a = $(this).parent().siblings(".userName").html();
		banUser_Ajax(a).done(function(data) {
			$("body").append(data);
			$("#modalTrigger").click();
			console.log($("#modalBody").html());
		}).fail(function(xhr, status, errorThrown) {
			alert("Could not get the requested data.")
		}).always(function(xhr, statuse) {
			console.log("Always");
		});
	});
	$(".unbanButton").on("click", function() {
		var a = $(this).parent().siblings(".userName").html();
		unbanUser_Ajax(a).done(function(data) {
			$("body").append(data);
			$("#modalTrigger").click();
			console.log($("#modalBody").html());
		}).fail(function(xhr, status, errorThrown) {
			alert("Could not get the requested data.")
		}).always(function(xhr, statuse) {
			console.log("Always");
		});
	});
});

function banUser_Ajax(a) {
	var userData = {};
	userData["userName"] = a;
	userData["ban"] = "1";
	return $.ajax({
		url : "Ban",
		type : "post",
		data : userData
	});
}

function unbanUser_Ajax(a) {
	var userData = {};
	userData["userName"] = a;
	userData["ban"] = "0";
	return $.ajax({
		url : "Ban",
		type : "post",
		data : userData
	});
}