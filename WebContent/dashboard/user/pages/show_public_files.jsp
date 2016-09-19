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
						<h1>Uploaded files</h1>
					</div>


					<br /> <br />

					<!-- ------------------------ time line -->
					<div class="col-xs-12 col-sm-10 col-sm-offset-1">
						<div class="timeline-container">

							<div class="timeline-label">
								<span class="label label-primary arrowed-in-right label-lg">
									<b>Uploaded filse</b>
								</span>
							</div>

							<s:iterator status="stat" value="files">
								<form action="downloadFile" method="post">


									<div class="timeline-items">

										<div class="timeline-item clearfix">
											<div class="timeline-info">
												<i
													class="timeline-indicator ace-icon fa fa-file-o btn btn-inverse no-hover"></i>
											</div>

											<div class="widget-box widget-color-dark">
												<div class="widget-header widget-header-small">
													<h5 class="widget-title smaller">
														<s:property value="fileName"></s:property>
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
														<p>
															UserName :
															<s:property value="userName" />
															<br /> File heading :
															<s:property value="heading" />
														</p>
														<div class="fileLocationDiv" style="visibility: hidden;">
															<input class="form-control" type="text"
																value=<s:property value="fileLocation"/>
																name="fileLocation">
														</div>

														<br /> <input type="submit" class="btn btn-inverse"
															value="Download">

													</div>
												</div>
											</div>
										</div>
									</div>

								</form>
							</s:iterator>

						</div>
					</div>
					<!-- ------------------/ end time line -->

					<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
					<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
					<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />


					<%@ include
						file="../../../dashboard/admin/includs/new_footer/new_footer.jsp"%>

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