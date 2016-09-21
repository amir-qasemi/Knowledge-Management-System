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
								<h1>Send message</h1>
							</div>

							<form action="addMessage" method="post">
								<div class="col-lg-4">
									<div class="widget-box widget-color-red">
										<div class="widget-header panel-heading">Description
											Lists</div>
										<div class="widget-body panel-body">
											<dl>
												<dt>Page Description</dt>
												<dd>Your message in this page after save show for other
													users</dd>
											</dl>
										</div>
										<!-- /.panel-body -->
									</div>
									<!-- /.panel -->
								</div>
								<div class=" col-md-offset-4">
									<div class="widget-box widget-color-green">
										<div class="widget-header panel-heading">
											<div class="row">
												<div class="col-xs-3">
													<i class="fa fa-comments fa-5x"></i>
												</div>
												<div class="col-xs-9 text-right">
													<div class="huge">Send Message</div>
												</div>
											</div>
										</div>
										<div class="widget-body panel-body">
											<div class="form-group input-group col-xs-12">
												<label>UserName</label> <input type="text"
													class="form-control"
													value=<s:property value="#session.user.userName" />
													disabled name="userName"> <br /> <label>MessageType</label>
												<select name="heading" class="form-control">
													<option>Knowledge</option>
													<option>AdminAdvise</option>
													<option>Site</option>
													<option>Other</option>
												</select> <br /> <label>Message</label>
												<textarea name="message" placeholder="Message..."
													class="form-control" rows="3"></textarea>
												<div class="col-xs-12">
													<br /> <input type="submit" value="Send message"
														class="btn btn-outline btn-success">
												</div>
											</div>
										</div>
									</div>
								</div>
							</form>

						</div>
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

	<!-- add AJAX for sign out -->
	<script
		src="authentication/signout/ajax/ajax_request_for_sign_out/ajax_sign_out.js"></script>
</body>
</html>