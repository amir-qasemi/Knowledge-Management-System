<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>AdminPage</title>
<link rel="icon" type="image/jpg" href="images/title.jpg">

<%@ include
	file="../includs/template/new_css_admin_dashboard_include.jsp"%>

</head>
<body class="no-skin">
	<!-- navigation bar -->
	<%@ include file="../includs/new_side_bar_and_nav_bar/new_nave_bar.jsp"%>

	<div class="main-container ace-save-state" id="main-container">

		<!-- side bar -->
		<%@ include
			file="../includs/new_side_bar_and_nav_bar/new_side_bar.jsp"%>

		<div class="main-content">
			<div class="main-content-inner">

				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
							<!-- PAGE CONTENT BEGINS -->

							<!-- heading -->
							<div class="page-header">
								<h1>User profile</h1>
							</div>

							<!-- ------------------- add extention here -->

							<h1>
								<span
									class="label label-xlg label-primary arrowed arrowed-right"><s:property
										value="you.role" /></span>
							</h1>

							<div class="col-xs-12 col-sm-9">
								<h4 class="blue">
									<span class="middle"><s:property value="you.firstName" />.<s:property
											value="you.lastName" /></span> <span
										class="label label-purple arrowed-in-right"> <i
										class="ace-icon fa fa-circle smaller-80 align-middle"></i>
										online
									</span>
								</h4>

								<div class="profile-user-info">
									<div class="profile-info-row">
										<div class="profile-info-name">Username</div>

										<div class="profile-info-value">
											<span><s:property value="you.userName" /></span>
										</div>
									</div>

									<div class="profile-info-row">
										<div class="profile-info-name">ID</div>

										<div class="profile-info-value">
											<span><s:property value="you.id" /></span>
										</div>
									</div>

									<div class="profile-info-row">
										<div class="profile-info-name">Phone number</div>

										<div class="profile-info-value">
											<i class="fa fa-map-marker light-orange bigger-110"></i> <span><s:property
													value="you.phoneNumber" /></span>
										</div>
									</div>

									<div class="profile-info-row">
										<div class="profile-info-name">Birth date</div>

										<div class="profile-info-value">
											<span><s:property value="you.birthDate" /></span>
										</div>
									</div>

									<div class="profile-info-row">
										<div class="profile-info-name">Joined</div>

										<div class="profile-info-value">
											<span><s:property value="you.registrationDate" /></span>
										</div>
									</div>

								</div>

								<div class="hr hr-8 dotted"></div>

								<div class="profile-user-info">
									<div class="profile-info-row">
										<div class="profile-info-name">Email</div>

										<div class="profile-info-value">
											<a href="#" target="_blank"><s:property value="you.email" /></a>
										</div>
									</div>
								</div>
							</div>

							<!-- -------------------/ add extention here -->

							<div style="visibility: hidden;">
								<!-- this page include the action message but it is high in class ajaxUserPage.js -->
								<%@ include
									file="../../../authentication/action/action_message/action_message.jsp"%>
								<%@ include
									file="../../../authentication/signout/ajax/ajax_sign_out_action_message/ajax_sign_out_error_message.jsp"%>
							</div>

						</div>
					</div>
					<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
					<br /> <br /> <br /> <br /> <br /> <br /> <br />
					<!-- PAGE CONTENT ENDS -->
					<%@ include file="../includs/new_footer/new_footer.jsp"%>
				</div>
				<!-- ------------------/ slider -->
			</div>
			<!-- PAGE CONTENT ENDS -->
		</div>
		<!-- /.col -->
	</div>

	<!-- this JS file control the user page actions -->
	<%@ include
		file="../includs/template/new_js_admin_dashboard_include.jsp"%>

	<script src="dashboard/admin/js/admin_page_control/control.js"></script>

	<!-- ad AJAX for sign out -->
	<script
		src="authentication/signout/ajax/ajax_request_for_sign_out/ajax_sign_out.js"></script>
</body>
</html>