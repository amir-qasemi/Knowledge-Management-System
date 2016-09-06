<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<script type="text/javascript">
	$(function() {
		$("#actionErrorContainer").hide();
		$("#actionSuccessContainer").hide();
		$("#register").on("click", function() {
			var a = $("#userName").val();
			$("#ActionUserName").val(a);
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
		dynamicdata["role"] = $("#role").val();
		return $.ajax({
			url : "signup",
			type : "post",
			data : dynamicdata
		});
	}

	
</script>