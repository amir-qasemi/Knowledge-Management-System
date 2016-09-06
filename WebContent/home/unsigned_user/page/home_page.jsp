<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>KM_HomePage</title>

<!-- this JSP file content have all of home page includs -->
<%@ include file="../include/css_home_page_includs.jsp"%>

</head>
<!-- header -->

<body id="home" background="images/bg.jpg">
	<section class="content">

		<!-- including navigation bar for home page here -->
		<%@ include file="../include/nave_bar/home_page_navbar.jsp"%>

		<br> <br> <br> <br> <br> <br> <br>
		<div class="content row">
			<div class="col col-xs-12">
				<!-- /#sidebar-wrapper -->
				<!-- Header -->
				<header id="top" class="header">
					<div class="text-vertical-center">
						<h1>Knowledge Management System</h1>
						<h3>&amp; four your Trade</h3>
						<br>
						<div class="col col-xs-6">
							<form action="signinRedirectAction" method="post">
								<div class="pull-right">
									<button type="submit" class="btn btn-dark btn-lg">
										Signin <i class="fa fa-sign-in fa-3x"></i>
									</button>
								</div>
							</form>
						</div>
						<div class="col col-xs-6">
							<form action="signupRedirectAction" method="post">
								<div class="pull-left">
									<button type="submit" class="btn btn-dark btn-lg">
										Signup <i class="fa fa-send-o fa-3x"></i>
									</button>
								</div>
							</form>
						</div>
					</div>
				</header>
			</div>
		</div>
		<!-- content row -->
	</section>
	<!-- content -->
	<!-- including java script file -->
	<%@ include file="../include/js_home_page_includs.jsp"%>

</body>
</html>