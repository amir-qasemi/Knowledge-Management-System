<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<s:actionerror theme="simple" escape="true" id="ajaxSigninActionError"
	name="ajaxSigninActionError" cssClass="hide" />

<script type="text/javascript">
	$(function() {
		$("#actionErrorContainer").show();
		$("#errorMessageDiv").html($("#ajaxSigninActionError").html());

		$("#ajaxSigninActionError").remove();
	});
</script>