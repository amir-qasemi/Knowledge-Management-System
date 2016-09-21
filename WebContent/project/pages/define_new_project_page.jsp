<%@page import="com.opensymphony.xwork2.util.location.Location"%>
<%@page import="javax.xml.ws.Action"%>
<%@page import="actions.error.Error500RedirectAction"%>
<%@page import="java.util.Map"%>
<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@page import="user.User"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@page import="com.sun.xml.internal.bind.v2.schemagen.xmlschema.Import"%>
<%@page import="org.apache.struts2.components.Include"%>
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

	<!-- This form eject request if not loged in -->
	<%
		Map httpSession = (Map) ActionContext.getContext().get("session");
		User user = (User) httpSession.get("user");
		if (user == null) {
	%>
	<script>
		window.location.href = "Error500";
	</script>
	<%
		}
	%>

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
									<h1>Define new project</h1>
								</div>

								<!-- -------------- process stage -->

								<ul class="steps" style="margin-left: 0">
									<li data-step="1" class="active"><span class="step">1</span>
										<span class="title">Create project</span></li>

									<li data-step="2"><span class="step">2</span> <span
										class="title">Add members</span></li>

									<li data-step="3"><span class="step">3</span> <span
										class="title">Access level</span></li>

									<li data-step="4"><span class="step">4</span> <span
										class="title">Success</span></li>
								</ul>

								<!-- --------------/ process stage -->


								<div class="widget-box widget-color-blue">
									<div class="widget-header">
										<h5 class="widget-title bigger lighter">Define your
											project</h5>
									</div>

									<div class="widget-body">
										<div class="widget-main">
											<form action="createNewProject" method="post">
												<ul class="list-unstyled spaced2">

													<li>
														<div class="form-group">
															<label class="col-sm-3 control-label no-padding-right"
																for="form-field-1"> Project name </label>

															<div class="col-sm-9">
																<input type="text" id="form-field-1"
																	placeholder="Project name ..." name="projectName"
																	class="col-xs-10 col-sm-5">
															</div>
														</div>
													</li>
													<br />
													<br />
													<li>
														<div class="form-group">
															<label class="col-sm-3 control-label no-padding-right"
																for="form-field-1"> Project description </label>

															<div class="col-sm-9">
																<textarea style="resize: none;" cols="10"
																	class="form-control" name="projectDescription"
																	placeholder="Project description ..."></textarea>
															</div>
														</div>
													</li>
													<br />
													<br />
													<br />
													<li>
														<div class="form-group">
															<label class="col-sm-3 control-label no-padding-right"
																for="form-field-1"> Project wiki name </label>

															<div class="col-sm-9">
																<input type="text" id="form-field-1"
																	placeholder="wiki name ..." name="wikiName"
																	class="col-xs-10 col-sm-5">
																<div class="pull-right">
																	<button type="submit" class="btn btn-warning btn-xlg">
																		Next <i
																			class="ace-icon fa fa-arrow-right icon-on-right"></i>
																	</button>
																</div>
															</div>
														</div>
													</li>

												</ul>
											</form>

											<hr>
											<div class="price">
												<i class="menu-icon glyphicon glyphicon-th-list"></i>
											</div>
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