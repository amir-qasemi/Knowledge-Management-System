<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>AdminPage</title>

<%@ include
	file="../includs/template/new_css_admin_dashboard_include.jsp"%>

</head>
<!-- /head -->
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
								<h1>Admin dashboard</h1>
							</div>

							<!-- ---------------------------- panels -->
							<div class="col-xs-6 col-sm-4 pricing-box">
								<div class="widget-box widget-color-dark">
									<div class="widget-header">
										<h5 class="widget-title bigger lighter">Send message</h5>
									</div>

									<div class="widget-body">
										<div class="widget-main">
											<ul class="list-unstyled spaced2">
												<li>Send message dive : your message after sending show
													for all of user !</li>
											</ul>

											<hr>
											<div class="price">
												<i class="fa fa-envelope"></i>
											</div>
										</div>

										<div>
											<a href="sendMessageRedirect"
												class="btn btn-block btn-inverse"> <span>See</span>
											</a>
										</div>
									</div>
								</div>
							</div>

							<div class="col-xs-6 col-sm-4 pricing-box">
								<div class="widget-box widget-color-orange">
									<div class="widget-header">
										<h5 class="widget-title bigger lighter">See received
											messages</h5>
									</div>

									<div class="widget-body">
										<div class="widget-main">
											<ul class="list-unstyled spaced2">
												<li>See message dive : show to you all of messages that
													received from users !</li>
											</ul>

											<hr>
											<div class="price">
												<i class="fa fa-maxcdn"></i>
											</div>
										</div>

										<div>
											<a href="seeMesaages" class="btn btn-block btn-warning">
												<span>See</span>
											</a>
										</div>
									</div>
								</div>
							</div>

							<div class="col-xs-6 col-sm-4 pricing-box">
								<div class="widget-box widget-color-blue">
									<div class="widget-header">
										<h5 class="widget-title bigger lighter">Upload file</h5>
									</div>

									<div class="widget-body">
										<div class="widget-main">
											<ul class="list-unstyled spaced2">
												<li>upload file dive : this dive provided for upload
													your files for other users !</li>
											</ul>

											<hr>
											<div class="price">
												<i class="fa fa-upload"></i>
											</div>
										</div>

										<div>
											<a href="sendFileRedirect" class="btn btn-block btn-primary">
												<span>See</span>
											</a>
										</div>
									</div>
								</div>
							</div>

							<div class="col-xs-6 col-sm-4 pricing-box">
								<div class="widget-box widget-color-red">
									<div class="widget-header">
										<h5 class="widget-title bigger lighter">See uploaded
											files</h5>
									</div>

									<div class="widget-body">
										<div class="widget-main">
											<ul class="list-unstyled spaced2">
												<li>see uploaded file dive : this dive provided for see
													uploaded files for other users !</li>
											</ul>

											<hr>
											<div class="price">
												<i class="fa fa-download"></i>
											</div>
										</div>

										<div>
											<a href="seeUploadedFiles" class="btn btn-block btn-danger">
												<span>See</span>
											</a>
										</div>
									</div>
								</div>
							</div>

							<div class="col-xs-6 col-sm-4 pricing-box">
								<div class="widget-box widget-color-green">
									<div class="widget-header">
										<h5 class="widget-title bigger lighter">Wiki</h5>
									</div>

									<div class="widget-body">
										<div class="widget-main">
											<ul class="list-unstyled spaced2">
												<li>Wiki dive : this dive provided to create your wiki
													<br/>!</li>
											</ul>

											<hr>
											<div class="price">
												<i class="menu-icon fa fa-stack-overflow"></i>
											</div>
										</div>

										<div>
											<a href="wikiPage" class="btn btn-block btn-success"> <span>See</span>
											</a>
										</div>
									</div>
								</div>
							</div>

							<div class="col-xs-6 col-sm-4 pricing-box">
								<div class="widget-box widget-color-pink">
									<div class="widget-header">
										<h5 class="widget-title bigger lighter">Project</h5>
									</div>

									<div class="widget-body">
										<div class="widget-main">
											<ul class="list-unstyled spaced2">
												<li>Project dive :create your
													project and use them with your coleague in a party !</li>
											</ul>

											<hr>
											<div class="price">
												<i class="menu-icon glyphicon glyphicon-th-list"></i>
											</div>
										</div>

										<div>
											<a href="projectRedirect" class="btn btn-block btn-pink"> <span>See</span>
											</a>
										</div>
									</div>
								</div>
							</div>
							<!-- -----------------------------/panels -->
						</div>
					</div>

					<br />
					<!-- heading -->
					<div class="page-header">
						<h1>Received request for register</h1>
					</div>


				</div>

				<div style="visibility: hidden;">
					<!-- this page include the action message but it is high in class ajaxUserPage.js -->
					<%@ include
						file="../../../authentication/action/action_message/action_message.jsp"%>
					<%@ include
						file="../../../authentication/signout/ajax/ajax_sign_out_action_message/ajax_sign_out_error_message.jsp"%>
				</div>

				<!-- PAGE CONTENT ENDS -->
			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->
		<!-- footer -->
		<%@ include file="../includs/new_footer/new_footer.jsp"%>
	</div>
	<!-- /.page-content -->

	<!-- this JS file control the user page actions -->
	<%@ include
		file="../includs/template/new_js_admin_dashboard_include.jsp"%>

	<script src="dashboard/admin/js/admin_page_control/control.js"></script>

	<!-- ad AJAX for sign out -->
	<script
		src="authentication/signout/ajax/ajax_request_for_sign_out/ajax_sign_out.js"></script>

</body>
</html>