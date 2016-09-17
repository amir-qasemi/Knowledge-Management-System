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
						<h1>Send message</h1>
					</div>

					<br /> <br />
					<form action="addMessage" method="post">
						<div class="col-lg-4">
							<div class="widget-box widget-color-red">
								<div class="widget-header panel-heading">Description Lists</div>
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
											value=<s:property value="#session.user.userName" /> disabled
											name="userName"> <br /> <label>MessageType</label> <select
											name="heading" class="form-control">
											<option>Knowledge</option>
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

					<br />
					<br />
					<br />
					<br />

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