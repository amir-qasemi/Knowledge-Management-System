<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Project</title>
<link rel="icon" type="image/jpg" href="images/title.jpg">

<!-- CSS includes files -->
<%@ include file="../includs/templates/css_include_files.jsp"%>

</head>
<body class="no-skin">

	<div id="wrapper">
		<!-- including navigation bar -->
		<%@ include file="../includs/nave_bar/project_nav_bar.jsp"%>

		<div class="main-container ace-save-state" id="main-container">


			<div class="col col-xs-4">

				<!-- include side bar -->
				<%@ include file="../includs/side_bar/project_side_bar.jsp"%>

			</div>

			<div class="main-content">
				<div class="main-content-inner">

					<div class="page-content">
						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->

								<!-- ----------- page content -->

								<!-- heading -->
								<div class="page-header">
									<h1>Success message</h1>
								</div>

								<!-- -------------- process stage -->

								<ul class="steps" style="margin-left: 0">
									<li data-step="1" class="active"><span class="step">1</span>
										<span class="title">Create project</span></li>

									<li data-step="2" class="active"><span class="step">2</span>
										<span class="title">Add members</span></li>

									<li data-step="3" class="active"><span class="step">3</span>
										<span class="title">Access level</span></li>

									<li data-step="4" class="active"><span class="step">4</span>
										<span class="title">Success</span></li>
								</ul>

								<!-- --------------/ process stage -->

								<div class="error-container">
									<div class="well">
										<h1 class="grey lighter smaller">
											<span class="blue bigger-125"> <i
												class="ace-icon fa fa-sitemap"></i> Success
											</span> project successfully created
										</h1>

										<hr>

										<div>
											<div class="space"></div>
											<h4 class="smaller">Try one of the following:</h4>

											<ul class="list-unstyled spaced inline bigger-110 margin-15">
												<li><i class="ace-icon fa fa-hand-o-right blue"></i>Check
													the project after create</li>
											</ul>
										</div>
										<hr>
										<div class="space"></div>
										<div class="center">
											<a href="projectRedirect" class="btn btn-primary"> <i
												class="glyphicon glyphicon-new-window"></i> Project start
												page
											</a>
										</div>

									</div>
								</div>

								<!-- -----------/ page content -->

								<!-- ------------------------/ project body -->
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
						<%@ include
							file="../../../dashboard/admin/includs/new_footer/new_footer.jsp"%>
					</div>
					<!-- /.page-content -->
				</div>
			</div>

		</div>
	</div>

	<!-- JS includes files -->
	<%@ include file="../includs/templates/js_include_files.jsp"%>

	<!-- ad AJAX for sign out -->
	<script
		src="authentication/signout/ajax/ajax_request_for_sign_out/ajax_sign_out.js"></script>
	<script>
		$("#menu-toggle").click(function(e) {
			e.preventDefault();
			$("#wrapper").toggleClass("toggled");
		});
	</script>
</body>
</html>