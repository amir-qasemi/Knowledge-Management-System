<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<script type="text/javascript">
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
		dynamicdata["firstName"] = $("#firstName").val();
		dynamicdata["lastName"] = $("#lastName").val();
		dynamicdata["birthDate"] = $("#birthDate").val();
		dynamicdata["phoneNumber"] = $("#phoneNumber").val();
		return $.ajax({
			url : "quiteSignupAction",
			type : "post",
			data : dynamicdata
		});
	}

	
</script>