<%@page import="com.opensymphony.xwork2.util.location.Location"%>
<%@page import="javax.xml.ws.Action"%>
<%@page import="actions.error.Error500RedirectAction"%>
<%@page import="java.util.Map"%>
<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@page import="user.User"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@page import="com.sun.xml.internal.bind.v2.schemagen.xmlschema.Import"%>
<%@page import="org.apache.struts2.components.Include"%>
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
<!-- /head -->
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
								<h1>Messages form</h1>
							</div>

							<div class="col-lg-12">
								<div class="col-lg-3 col-md-6">
									<div class="widget-box widget-color-red">
										<div class="widget-header panel-heading">
											<div class="row">
												<div class="col-xs-3">
													<i class="fa fa-bomb fa-5x"></i>
												</div>
												<div class="col-xs-9 text-right">
													<div>AdminAdvise</div>
												</div>
											</div>
										</div>
										<div class="widget-body panel-body">
											<h4>Description :</h4>
											<br />
											<p>the message like this from Admin and importance for
												users</p>
										</div>
									</div>
								</div>

								<div class="col-lg-3 col-md-6">
									<div class="widget-box widget-color-blue">
										<div class="widget-header panel-heading">
											<div class="row">
												<div class="col-xs-3">
													<i class="fa fa-pencil fa-5x"></i>
												</div>
												<div class="col-xs-9 text-right">
													<div>Knowledge</div>
												</div>
											</div>
										</div>
										<div class="widget-body panel-body">
											<h4>Description :</h4>
											<br />
											<p>the message like this say about knowledge and about
												this system architect</p>
										</div>
									</div>
								</div>

								<div class="col-lg-3 col-md-6">
									<div class="widget-box widget-color-green">
										<div class="widget-header panel-heading">
											<div class="row">
												<div class="col-xs-3">
													<i class="fa fa-bullhorn fa-5x"></i>
												</div>
												<div class="col-xs-9 text-right">
													<div>Site</div>
												</div>
											</div>
										</div>
										<div class="widget-body panel-body">
											<h4>Description :</h4>
											<br />
											<p>the messages like this icon about the site news</p>
										</div>
									</div>
								</div>

								<div class="col-lg-3 col-md-6">
									<div class="widget-box widget-color-orange">
										<div class="widget-header panel-heading">
											<div class="row">
												<div class="col-xs-3">
													<i class="fa fa-coffee fa-5x"></i>
												</div>
												<div class="col-xs-9 text-right">
													<div>Other</div>
												</div>
											</div>
										</div>
										<div class="widget-body panel-body">
											<h4>Description :</h4>
											<br />
											<p>the messages like this icon is other messages</p>
										</div>
									</div>
								</div>
							</div>

							<!-- ------------- end top dive -->

							<!-- -------- time line -------------------------- -->

							<!-- heading -->
							<div class="page-header">
								<h1>Messages time line</h1>
							</div>

							<div class="col-xs-12 col-sm-10 col-sm-offset-1">
								<div class="timeline-container">

									<div class="timeline-label">
										<span class="label label-primary arrowed-in-right label-lg">
											<b>Messages</b>
										</span>
									</div>

									<!-- all of the content write in iterator -->
									<s:iterator value="messages" var="Message">

										<s:if test="%{#Message.heading=='AdminAdvise'}">


											<div class="timeline-items">

												<div class="timeline-item clearfix">
													<div class="timeline-info">
														<i
															class="timeline-indicator ace-icon fa fa-bomb btn btn-danger no-hover"></i>
													</div>

													<div class="widget-box widget-color-red2">
														<div class="widget-header widget-header-small">
															<h5 class="widget-title smaller">
																<s:property value="userName" />
															</h5>

															<span class="widget-toolbar no-border"> <i
																class="ace-icon fa fa-clock-o bigger-110"></i> <s:property
																	value="date" />
															</span> <span class="widget-toolbar"> <a href="#"
																data-action="collapse"> <i
																	class="ace-icon fa fa-chevron-up"></i>
															</a>
															</span>
														</div>

														<div class="widget-body">
															<div class="widget-main">
																<s:property value="message" />
																.
															</div>
														</div>
													</div>
												</div>
											</div>
											<!-- /.timeline-items -->
										</s:if>


										<s:elseif test="%{#Message.heading=='Knowledge'}">

											<div class="timeline-items">

												<div class="timeline-item clearfix">
													<div class="timeline-info">
														<i
															class="timeline-indicator ace-icon fa fa-pencil btn btn-primary no-hover"></i>
													</div>

													<div class="widget-box widget-color-blue">
														<div class="widget-header widget-header-small">
															<h5 class="widget-title smaller">
																<s:property value="userName" />
															</h5>

															<span class="widget-toolbar no-border"> <i
																class="ace-icon fa fa-clock-o bigger-110"></i> <s:property
																	value="date" />
															</span> <span class="widget-toolbar"> <a href="#"
																data-action="collapse"> <i
																	class="ace-icon fa fa-chevron-up"></i>
															</a>
															</span>
														</div>

														<div class="widget-body">
															<div class="widget-main">
																<s:property value="message" />
																.
															</div>
														</div>
													</div>
												</div>
											</div>
										</s:elseif>


										<s:elseif test="%{#Message.heading=='Site'}">


											<div class="timeline-items">
												<div class="timeline-item clearfix">
													<div class="timeline-info">
														<i
															class="timeline-indicator ace-icon fa fa-bullhorn btn btn-success no-hover"></i>
													</div>

													<div class="widget-box widget-color-green">
														<div class="widget-header widget-header-small">
															<h5 class="widget-title smaller">
																<s:property value="userName" />
															</h5>

															<span class="widget-toolbar no-border"> <i
																class="ace-icon fa fa-clock-o bigger-110"></i> <s:property
																	value="date" />
															</span> <span class="widget-toolbar"> <a href="#"
																data-action="collapse"> <i
																	class="ace-icon fa fa-chevron-up"></i>
															</a>
															</span>
														</div>

														<div class="widget-body">
															<div class="widget-main">
																<s:property value="message" />
																.
															</div>
														</div>
													</div>
												</div>
											</div>
										</s:elseif>


										<s:elseif test="%{#Message.heading=='Other'}">

											<div class="timeline-items">
												<div class="timeline-item clearfix">
													<div class="timeline-info">
														<i
															class="timeline-indicator ace-icon fa fa fa-coffee btn btn-warning no-hover"></i>
													</div>

													<div class="widget-box widget-color-orange">
														<div class="widget-header widget-header-small">
															<h5 class="widget-title smaller">
																<s:property value="userName" />
															</h5>

															<span class="widget-toolbar no-border"> <i
																class="ace-icon fa fa-clock-o bigger-110"></i> <s:property
																	value="date" />
															</span> <span class="widget-toolbar"> <a href="#"
																data-action="collapse"> <i
																	class="ace-icon fa fa-chevron-up"></i>
															</a>
															</span>
														</div>

														<div class="widget-body">
															<div class="widget-main">
																<s:property value="message" />
																.
															</div>
														</div>
													</div>
												</div>
											</div>
										</s:elseif>


									</s:iterator>

								</div>
							</div>
							<!-- end time line -->

							<!-- ----------/ time line -------------------------- -->

							<div style="visibility: hidden;">
								<!-- this page include the action message but it is high in class ajaxUserPage.js -->
								<%@ include
									file="../../../authentication/action/action_message/action_message.jsp"%>
								<%@ include
									file="../../../authentication/signout/ajax/ajax_sign_out_action_message/ajax_sign_out_error_message.jsp"%>
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
		<%@ include file="../includs/new_footer/new_footer.jsp"%>
	</div>
	<!-- /.page-content -->

	<!-- this JS file control the user page actions -->
	<%@ include
		file="../includs/template/new_js_admin_dashboard_include.jsp"%>

	<script src="dashboard/admin/js/admin_page_control/control.js"></script>

	<!-- ad AJAX for sign out after compleat this -->
	<script
		src="authentication/signout/ajax/ajax_request_for_sign_out/ajax_sign_out.js"></script>
</body>
</html>