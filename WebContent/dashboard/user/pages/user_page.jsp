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
					<div class="error-container">
						<div class="well">
							<h1 class="grey lighter smaller">
								<span class="blue bigger-125"> <i
									class="ace-icon fa fa-dashboard"></i> welcome
								</span>
								<s:property value="#session.user.userName" />
							</h1>

							<hr>
							<!-- TODO : start from here -->

						</div>
					</div>

					<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
					<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
					<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
					<br /> <br /> <br /> <br /> <br /> <br />



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