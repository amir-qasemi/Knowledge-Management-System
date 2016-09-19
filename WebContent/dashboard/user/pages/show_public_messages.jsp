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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User</title>
<link rel="icon" type="image/jpg" href="images/title.jpg">

<!-- CSS includes -->
<%@ include file="../includs/template_includs/css_include_files.jsp"%>

<style type="text/css">
#menu-toggle {
	position: absolute;
}
</style>

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

		<!-- include side bar -->
		<%@ include file="../includs/sidebar/side_bar.jsp"%>

		<!-- Page Content -->
		<div id="page-content-wrapper">
			<div class="container-fluid">
				<div class="row">
					<!-- navigation bar -->
					<%@ include file="../includs/navebar/user_nave_bar.jsp"%>

					<!-- heading -->
					<div class="page-header">
						<h1>Messages form</h1>
					</div>

					<br /> <br />

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
									<p>the message like this say about knowledge and about this
										system architect</p>
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

						<br /> <br /> <br />

						<%@ include
							file="../../../dashboard/admin/includs/new_footer/new_footer.jsp"%>

					</div>
					<!-- end time line -->

					<!-- ----------/ time line -------------------------- -->

				</div>
			</div>
		</div>
	</div>
	<!-- /#page-content-wrapper -->
	<!-- /#wrapper -->


	<!-- JS includes files -->
	<%@ include file="../includs/template_includs/js_include_files.jsp"%>

	<!-- ad AJAX for sign out -->
	<script
		src="authentication/signout/ajax/ajax_request_for_sign_out/ajax_sign_out.js"></script>


	<script>
		$("#menu-toggle").click(function(e) {
			e.preventDefault();
			$("#wrapper").toggleClass("toggled");
		});
		/* When the user clicks on the button,
		 toggle between hiding and showing the dropdown content */
		function myFunction() {
			document.getElementById("myDropdown").classList.toggle("show");
		}

		// Close the dropdown if the user clicks outside of it
		window.onclick = function(e) {
			if (!e.target.matches('.dropbtn')) {

				var dropdowns = document
						.getElementsByClassName("dropdown-content");
				for (var d = 0; d < dropdowns.length; d++) {
					var openDropdown = dropdowns[d];
					if (openDropdown.classList.contains('show')) {
						openDropdown.classList.remove('show');
					}
				}
			}
		}
	</script>
</body>
</html>