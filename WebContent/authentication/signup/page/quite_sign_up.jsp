<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>AdminPage</title>

<%@ include
	file="../../../dashboard/admin/includs/template/new_css_admin_dashboard_include.jsp"%>

</head>
<!-- header -->
<body class="no-skin">
	<!-- navigation bar -->
	<%@ include
		file="../../../dashboard/admin/includs/new_side_bar_and_nav_bar/new_nave_bar.jsp"%>

	<div class="main-container ace-save-state" id="main-container">

		<!-- side bar -->
		<%@ include
			file="../../../dashboard/admin/includs/new_side_bar_and_nav_bar/new_side_bar.jsp"%>

		<div class="main-content">
			<div class="main-content-inner">

				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
							<!-- PAGE CONTENT BEGINS -->

							<!-- heading -->
							<div class="page-header">
								<h1>Quite register user</h1>
							</div>
							<div
								class="col col-xs-12 col-s-12 col-md-offset-2 col-md-8 col-lg-offset-2 col-lg-6 ">
								<div class="widget-box widget-color-green">
									<div class="widget-header panel-heading heading">
										Quite signup
										<s:property value="userName" />
									</div>
									<div class="widget-body panel-body">
										<form action="quiteSignupAction" method="post">

											<div style="visibility: hidden;">
												<input type="text" id="userName" name="userName"
													value='<s:property value="userName"/>'>
											</div>

											<div class="col-xs-12">
												<label for="firstName">First name :</label> <input
													type="text" class="form-control" id="firstName"
													placeholder="First name" required autofocus>
											</div>
											<!-- userName -->

											<div class="col-xs-12">
												<label for="lastName">Last name :</label> <input type="text"
													class="form-control" id="lastName" placeholder="Last name"
													required autofocus>
											</div>
											<!-- password -->

											<div class="col-xs-12">
												<label for="birthDate">Birth date :</label> <input
													type="date" class="form-control" name="confirmPassword"
													id="birthDate" placeholder="Birth date" required autofocus>
											</div>
											<!-- password -->

											<div class="col-xs-12">
												<label for="phoneNumber">Phone number :</label> <input
													type="text" class="form-control" id="phoneNumber"
													placeholder="Phone number" required autofocus>
											</div>
											<!-- email -->

											<span class="pull-right"> <br /> <input type="button"
												class="btn btn-success btn-lg log" value="Register"
												id="register"> <input type="Reset"
												class="btn btn-danger btn-lg">
											</span>
										</form>
									</div>
									<div>
										<!-- this area for show error message -->
										<%@ include
											file="../include/quite_sign_up_message/action_message.jsp"%>
										<%@ include
											file="../ajax/ajax_quite_sign_up_action_message/ajax_quite_sign_up_error_message.jsp"%>
										<%@ include
											file="../ajax/ajax_quite_sign_up_action_message/ajax_quite_sign_up_success_message.jsp"%>
									</div>
								</div>
							</div>
						</div>

					</div>

				</div>
				<!-- PAGE CONTENT ENDS -->
			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->
		<!-- footer -->
		<%@ include
			file="../../../dashboard/admin/includs/new_footer/new_footer.jsp"%>
	</div>
	<!-- /.page-content -->
	<!-- including java script file -->
	<%@ include file="../include/js_includes.jsp"%>

	<!-- the ajax request for sign up -->
	<div style="visibility: hidden;">
		<%@ include
			file="../../signup/ajax/ajax_request_for_quite_sign_up/ajax_sign_up.jsp"%>
	</div>

	<!-- this JS file control the user page actions -->
	<script
		src="dashboard/admin/includs/template/js_admin_dashboard_include.jsp"></script>

	<script src="dashboard/admin/js/admin_page_control/control.js"></script>

	<!-- ad AJAX for sign out -->
	<script
		src="authentication/signout/ajax/ajax_request_for_sign_out/ajax_sign_out.js"></script>

</body>
</html>