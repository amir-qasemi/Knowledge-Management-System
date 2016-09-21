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
						<h1>Your profile</h1>
					</div>

					<br /> <br /> <br />


					<!-- ----------------------- user profile content -->

					<div
						class="width-80 label label-info label-xlg arrowed-in arrowed-in-right">
						<div class="inline position-relative">
							<a href="#" class="user-title-label dropdown-toggle"
								data-toggle="dropdown"> <i
								class="ace-icon fa fa-circle light-green"></i> &nbsp; <span
								class="white"><s:property value="name" /> . <s:property
										value="lastName" /></span>
							</a>
						</div>
					</div>


					<div class="profile-user-info profile-user-info-striped">

						<div class="profile-info-row">
							<div class="profile-info-name">Name</div>

							<div class="profile-info-value">
								<span class="editable editable-click" id="name"><s:property
										value="name" /></span>
							</div>
						</div>

						<div class="profile-info-row">
							<div class="profile-info-name">Last name</div>

							<div class="profile-info-value">
								<span class="editable editable-click" id="lastName"><s:property
										value="lastName" /></span>
							</div>
						</div>


						<div class="profile-info-row">
							<div class="profile-info-name">Username</div>

							<div class="profile-info-value">
								<span class="editable editable-click" id="username"><s:property
										value="userName" /></span>
							</div>
						</div>

						<div class="profile-info-row">
							<div class="profile-info-name">Email</div>

							<div class="profile-info-value">
								<span class="editable editable-click" id="email"><s:property
										value="email" /></span>
							</div>
						</div>

						<div class="profile-info-row">
							<div class="profile-info-name">Phone number</div>

							<div class="profile-info-value">
								<span class="editable editable-click" id="phoneNumber"><s:property
										value="user.phoneNumber" /></span>
							</div>
						</div>

						<div class="profile-info-row">
							<div class="profile-info-name">Birth date</div>

							<div class="profile-info-value">
								<span class="editable editable-click" id="birthDate"><s:property
										value="birthDate" /></span>
							</div>
						</div>

						<div class="profile-info-row">
							<div class="profile-info-name">Signup date</div>

							<div class="profile-info-value">
								<span class="editable editable-click" id="signupDate"><s:property
										value="user.registrationDate" /></span>
							</div>
						</div>

						<div class="profile-info-row">
							<div class="profile-info-name">Role</div>

							<div class="profile-info-value">
								<span class="editable editable-click" id="role"><s:property
										value="role" /></span>
							</div>
						</div>
					</div>


					<!-- ---------------- edit -->

					<div class="tabbable tabs-left">
						<ul class="nav nav-tabs" id="myTab3">
							<li class="active"><a data-toggle="tab" href="#editUserName"
								aria-expanded="true"> <span
									class="label label-danger arrowed-in">Edit user name</span>
							</a></li>

							<li class=""><a data-toggle="tab" href="#editFirstName"
								aria-expanded="false"><span
									class="label label-danger arrowed-in">Edit first name</span> </a></li>

							<li class=""><a data-toggle="tab" href="#editLastNaem"
								aria-expanded="false"> <span
									class="label label-danger arrowed-in">Edit last name</span>
							</a></li>

							<li class=""><a data-toggle="tab" href="#editEmail"
								aria-expanded="false"> <span
									class="label label-danger arrowed-in">Edit email</span>
							</a></li>

							<li class=""><a data-toggle="tab" href="#editBirthDate"
								aria-expanded="false"> <span
									class="label label-danger arrowed-in">Edit birth date</span>
							</a></li>

							<li class=""><a data-toggle="tab" href="#editPhoneNumber"
								aria-expanded="false"> <span
									class="label label-danger arrowed-in">Edit phone number</span>
							</a></li>
						</ul>
						<div class="tab-content">
							<div id="editUserName" class="tab-pane active">
								<form action="editUserName" method="post">
									<div class="col col-xs-2">
										<label for="ex3">New user name :</label>
									</div>
									<div class="col col-xs-8">
										<input name="newUserName" class="form-control" id="ex3"
											type="text" name="newUserName"
											placeholder="New user name ...">
										<div style="visibility: hidden;">
											<input type="text" name="userName"
												value='<s:property value="userName"/>'>
										</div>
									</div>
									<div class="col col-xs-2">
										<input type="submit" class="btn btn-success" value="Save">
									</div>
								</form>
							</div>


							<div id="editFirstName" class="tab-pane">
								<form action="editfirstName" method="post">
									<div class="col col-xs-2">
										<label for="ex3">New first name :</label>
									</div>
									<div class="col col-xs-8">
										<input name="newName" class="form-control" id="ex3"
											type="text" name="name" placeholder="New first name ...">
										<div style="visibility: hidden;">
											<input type="text" name="userName"
												value='<s:property value="userName"/>'>
										</div>
									</div>
									<div class="col col-xs-2">
										<input type="submit" class="btn btn-success" value="Save">
									</div>
								</form>
							</div>
							<div id="editLastNaem" class="tab-pane">
								<form action="editLastName" method="post">
									<div class="col col-xs-2">
										<label for="ex3">New last name :</label>
									</div>
									<div class="col col-xs-8">
										<input name="newLastName" class="form-control" id="ex3"
											type="text" name="newLastName"
											placeholder="New last name ...">
										<div style="visibility: hidden;">
											<input type="text" name="userName"
												value='<s:property value="userName"/>'>
										</div>
									</div>
									<div class="col col-xs-2">
										<input type="submit" class="btn btn-success" value="Save">
									</div>
								</form>
							</div>
							<div id="editEmail" class="tab-pane">
								<form>
									<div class="col col-xs-2">
										<label for="ex3">New email :</label>
									</div>
									<div class="col col-xs-8">
										<input name="email" class="form-control" id="ex3" type="email"
											name="newEmail" placeholder="New email ...">
										<div style="visibility: hidden;">
											<input type="text" name="userName"
												value='<s:property value="userName"/>'>
										</div>
									</div>
									<div class="col col-xs-2">
										<input type="submit" class="btn btn-success" value="Save">
									</div>
								</form>
							</div>

							<div id="editBirthDate" class="tab-pane">
								<form>
									<div class="col col-xs-2">
										<label for="ex3">New birth date :</label>
									</div>
									<div class="col col-xs-8">
										<input name="email" class="form-control" id="ex3" type="date"
											name="newBirthDate" placeholder="New birth date ...">
										<div style="visibility: hidden;">
											<input type="text" name="userName"
												value='<s:property value="userName"/>'>
										</div>
									</div>
									<div class="col col-xs-2">
										<input type="submit" class="btn btn-success" value="Save">
									</div>
								</form>
							</div>

							<div id="editPhoneNumber" class="tab-pane">
								<form action="editPhoneNumber" method="post">
									<div class="col col-xs-2">
										<label for="ex3">New phone number :</label>
									</div>
									<div class="col col-xs-8">
										<input name="email" class="form-control" id="ex3" type="text"
											name="editedPhoneNumber" placeholder="New phone number ...">
										<div style="visibility: hidden;">
											<input type="text" name="userName"
												value='<s:property value="userName"/>'>
										</div>
									</div>
									<div class="col col-xs-2">
										<input type="submit" class="btn btn-success" value="Save">
									</div>
								</form>
							</div>

						</div>
					</div>

					<!-- / form of edit -->
					<!-- -----------------/ edit -->
					<!-- ------------------------/ user profile content -->

					<div style="visibility: hidden;">
						<!-- this page include the action message but it is high in class ajaxUserPage.js -->
						<%@ include
							file="../../../authentication/action/action_message/action_message.jsp"%>
						<%@ include
							file="../../../authentication/signout/ajax/ajax_sign_out_action_message/ajax_sign_out_error_message.jsp"%>
					</div>



					<br /> <br /> <br />



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