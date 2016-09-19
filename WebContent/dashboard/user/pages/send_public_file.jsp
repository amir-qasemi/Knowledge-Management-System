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
						<h1>Upload file</h1>
					</div>

					<br /> <br />

					<div class="col-lg-12">
						<div class="widget-box panel-info">
							<div class="widget-header widget-header-flat  panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="fa fa-save fa-5x"></i>
									</div>
									<div class="col-xs-9 text-right">
										<div class="huge">UploadFile</div>
									</div>
								</div>
							</div>
							<div class="panel-body">

								<p class="huge">you file after upload will show for other
									users</p>
								<br />

								<form action="uploadFile" enctype="multipart/form-data"
									method="post">
									<div class="col col-xs-6">
										UserName <i class="glyphicon glyphicon-user"></i>
									</div>
									<div class="col col-xs-6">
										<input type="text" class="form-control"
											value=<s:property value="#session.user.userName" /> disabled
											name="userName">
									</div>
									<div class="col col-xs-6">
										<br /> File <i class="fa fa-upload"></i>
									</div>
									<div class="col col-xs-6">
										<br /> <label class="ace-file-input"><input
											name="fileUploaded" type="file" id="id-input-file-2"><span
											class="ace-file-container" data-title="Choose"><span
												class="ace-file-name" data-title="No File ..."><i
													class=" ace-icon fa fa-upload"></i></span></span><a class="remove"
											href="#"><i class=" ace-icon fa fa-times"></i></a></label>
									</div>
									<div class="col col-xs-6">
										<br />File Heading <i class="fa fa-paperclip"></i>
									</div>
									<div class="col col-xs-6">
										<br />
										<textarea class="form-control" placeholder="File Heading ..."
											name="heading" rows="3"></textarea>
									</div>
									<div class="col col-xs-12">
										<br /> <input type="submit" value="SaveFile"
											class="btn btn-block btn-danger fa fa-fa-save">
									</div>

									<div class="keep" style="visibility: hidden;">
										<input type="text" name="fileName" id="uploadFileName">
									</div>

								</form>

							</div>
						</div>

						<br /> <br /> <br />

						<%@ include
							file="../../../dashboard/admin/includs/new_footer/new_footer.jsp"%>

					</div>

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