<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<script type="text/javascript">
	$(function() {
		$("#actionErrorContainer").hide();
		$("#actionSuccessContainer").hide();
		$("#login").on("click", function() {
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
		dynamicdata["password"] = $("#password").val();
		dynamicdata["rememberMe"] = $("#rememberMe").is(":checked");
		return $.ajax({
			url : "signin",
			type : "post",
			data : dynamicdata
		});
	}

	
</script>