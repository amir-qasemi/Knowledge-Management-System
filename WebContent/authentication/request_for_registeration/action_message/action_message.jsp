<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<br />
<!-- this area for show error message on log page or register page -->
<div class="alert panel" id="actionRegisterErrorContainer" role="alert">
	<button type="button" class="close" id="closeRegisterErrorMessage"
		aria-hidden="false">×</button>
	<i class="fa fa-bug"></i> :
	<div id="errorRegisterMessageDiv">
		<s:actionerror theme="simple" escape="true" name="actionError"
			cssClass="actionError" />
	</div>
	<!-- end received error text are dive -->
</div>
<!-- end action dive -->
<br />

<!-- this area for show the Success message on register page -->
<div class="alert panel" id="actionRegisterSuccessContainer" role="alert">
	<button type="button" class="close" id="closeRegisterSuccessDive"
		aria-hidden="true">×</button>
	<i class="glyphicon glyphicon-saved"></i>
	<div id="successRegisterMessageDiv">
		<s:actionerror theme="simple" escape="true" name="actionMessage"
			cssClass="actionMessage" />
		<br />
	</div>
	<!-- end received error text are dive -->
</div>
<!-- end action dive -->


<script>
	$(document).ready(function() {
		$("#closeRegisterErrorMessage").click(function() {
			$("#actionRegisterErrorContainer").hide();
		});
	});

	$(document).ready(function() {
		$("#closeRegisterSuccessDive").click(function() {
			$("#actionRegisterSuccessContainer").hide();
		});
	});
</script>
