<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>

<!-- this page includes in here -->
<%@ include file="/authentication/signin/include/css_includs.jsp"%>

</head>
<!-- header -->
<body id="home" background="images/bg.jpg">

	<!-- navigation bar -->
	<%@ include file="../include/navBar/siginNavbar.jsp"%>

	<br>
	<br>
	<br>

	<div class="container">
		<div class="row">
			<div
				class="col col-xs-12 col-s-12 col-md-offset-2 col-md-8 col-lg-offset-2 col-lg-6 ">
				<div class="panel login-panel">
					<div class="panel-heading heading">Signin:</div>
					<div class="panel-body">
						<form action="signin" method="post">
							<div class="form-group">
								<label for="userName">Username:</label> <input type="text"
									class="form-control" id="userName" name="userName"
									placeholder="Username">
							</div>
							<div class="form-group">
								<label for="pwd">Password:</label> <input type="password"
									class="form-control password" id="password" name="password"
									placeholder="Password">
							</div>
							<div class="checkbox">
								<label><input type="checkbox" id="rememberMe"
									name="rememberMe">Remember me</label>
							</div>

							<span class="pull-right"> <br /> <input type="button"
								class="btn btn-dark btn-lg log" value="Signin" id="submit">
								<input type="Reset" class="btn btn-dark btn-lg">
							</span>
						</form>
					</div>
					<div class="panel-footer footer">
						<!-- this area for show error message -->
						<%@ include file="../../action/action_message/action_message.jsp"%>
						<%@ include
							file="../ajax/ajax_sign_in_action_message/ajax_sig_in_error_message.jsp"%>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- content -->
	<div class="row"></div>
	<!-- content row -->

	<!-- including java script file -->
	<%@ include file="../include/js_includes.jsp"%>

	<!-- after adding error page on this pages we must add the AJAX controller for action in this section-->
	<div style="visibility: hidden;">
		<%@ include file="../ajax/ajax_request_for_sign_in/ajax_sign_in.jsp"%>
	</div>

	<!--
	<script type="text/javascript"
		src="authentication/signin/ajax/ajax_request_for_sign_in/ajax_sign_in.js"></script>-->
</body>
</html>