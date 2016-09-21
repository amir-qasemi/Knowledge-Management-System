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
<html lang="fa">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="Content-Language" content="fa" />
<title>کاربر</title>
<link rel="icon" type="image/jpg" href="images/title.jpg">

<!-- CSS includes -->
<%@ include file="../includs/template_includs/css_include_files.jsp"%>

<link rel="stylesheet" href="dashboard/user/css/user_page_custom_style/user_custom.css">
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

		<!-- user side bar -->

		<!-- Sidebar -->

		<div id="mySidenav" class="sidenav">
			<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
			<a type="submit" href="userDashboardRedirection"> <i
				class="fa fa-tachometer"></i> داشبورد
			</a> <a href="projectRedirect"><i
				class="glyphicon glyphicon-new-window"></i> صفحه استارت پروژه </a> <a
				type="submit" href="seeMesaages"> <i class="fa fa-envelope-o"></i>
				پیام های عمومی رسیده
			</a> <a type="submit" href="seeUploadedFiles"> <i
				class="menu-icon fa fa-files-o"></i> فایل های عمومی رسیده
			</a> <a type="submit" href="sendMessageRedirect"> <i
				class="menu-icon fa fa-bullhorn"></i> فرستادنه پیام عمومی
			</a> <a type="submit" href="sendFileRedirect"> <i
				class="menu-icon fa fa-upload"></i> فرستادنه فایله عمومی
			</a> <a type="submit" href="wikiPage"> <i
				class="menu-icon fa fa-stack-overflow"></i> ویکی
			</a>
		</div>
		<!-- /user side bar -->

		<!-- Page Content -->
		<div id="page-content-wrapper">
			<div class="container-fluid">
				<div class="row">
					<!-- navigation bar -->


					<nav class="navbar navbar-inverse">
						<div class="container-fluid">
							<ul class="nav navbar-nav navbar-right">
								<li><a href="">اخبار</a></li>
								<li><a href="">ارتباط با ما</a></li>
								<li><a href="">درباره ما</a></li>
								<li><a class="active" href=""><i class="fa fa-home"></i>خانه</a></li>
								<li><a style="font-size: 30px; cursor: pointer"
									onclick="openNav()">&#9776;</a></li>
							</ul>
							<ul class="nav navbar-nav">
								<li><a class="signout" value="SignOut" id="submit"> <i
										class="fa fa-sign-out fa-fw"></i> خروج
								</a></li>
								<li><a href="userProfileRedirect"><i
										class="ace-icon fa fa-user"></i> پروفایل </a></li>
								<li><a href="javascript:void(0)" class="dropbtn"
									onclick="myFunction()">زبانه شما</a>
									<div class="dropdown-content" id="myDropdown">
										<a href="#">فارسی</a> <a href="#">English</a>
									</div></li>
							</ul>
						</div>
					</nav>

					<!-- /navigation bar -->
					<div class="error-container">
						<div class="well">
							<h1 class="grey lighter smaller">
								<span class="blue bigger-125"> <i
									class="ace-icon fa fa-dashboard"></i> خوش آمدین
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