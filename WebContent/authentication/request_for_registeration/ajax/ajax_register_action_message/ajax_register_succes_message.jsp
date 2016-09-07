<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>

<s:actionmessage theme="simple" escape="true"
	id="ajaxSigninActionMessage" name="ajaxSigninActionMessage"
	cssClass="hide" />

<script type="text/javascript">
	$(function() {
		$("#closeRegisterSuccessDive").show();
		$("#successRegisterMessageDiv").html($("#ajaxSigninActionMessage").html());

		$("#ajaxSigninActionMessage").remove();
	});

	
</script>