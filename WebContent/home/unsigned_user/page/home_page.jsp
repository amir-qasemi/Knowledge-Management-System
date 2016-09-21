
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content=" Knowledge Management System" />
<meta name="keywords" content="KMS, Knowledge Management System">
<meta name="author" content="AmirH Qasemi">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Knowledge Management System</title>
<link rel="icon" type="image/jpg" href="images/title.jpg">

<!-- this JSP file content have all of home page includs -->
<%@ include file="../include/css_home_page_includs.jsp"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->


<link rel="stylesheet" href="mcaptcha/css/jquery.motionCaptcha.0.2.css" />

<link rel="stylesheet"
	href="authentication/captcha/captcha_css/captcha_css.css" />




</head>

<body id="index">

	<!-- Navigation Bar-->
	<nav id="mainNav"
		class="navbar navbar-default  navbar-fixed-top navbar-custom-transparent">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> Menu <i
						class="fa fa-bars"></i>
				</button>
				<a class="navbar-brand page-scroll " href="#page-top">KMS</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li><a class="page-scroll" href="#home"> Home </a></li>
					<li><a class="page-scroll" href="#about">About</a></li>
					<li><a class="page-scroll" href="#contact">Contact</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	<!-- / Navigation Bar -->

	<!-- Header-->
	<header id="home">
		<!-- The header image -->
		<div class="header-parallax parallax">
			<div class="container-fluid">
				<br /> <br /> <br /> <br /> <br /> <br />
				<div class="row">
					<div
						class="col col-lg-offset-1 col-lg-5 col-md-offset-1 col-md-5 col-sm-12 col-xs-12">
						<div class="panel panel-default text-center" id="info">
							<div class="panel-heading">
								<h2>Knowledge Management System</h2>
							</div>
							<div class="panel-body ">
								<button class="btn btn-dark btn-lg" id="signin-button">
									Signin <i class="fa fa-sign-in fa-3x"> </i>
								</button>
								<button class="btn btn-dark btn-lg" id="registration-button">
									Request Registration <i class="fa fa-user-plus fa-3x"
										aria-hidden="true"></i>
								</button>
							</div>
						</div>
					</div>

					<!-- Panels -->
					<div
						class="col col-lg-offset-1 col-lg-5  col-md-offset-1 col-md-4 col-sm-12 col-xs-12"
						id="form-panel">

						<!-- Signin Panel-->
						<div id="mc-form">
							<div id="signin-panel" class="panel login-panel hidden-panel">
								<div class="panel-heading my-heading">Signin:</div>
								<div class="panel-body">
									<div class="form-group">
										<label for="userName">Username:</label> <input type="text"
											class="form-control" id="userName" name="userName"
											placeholder="Username">
									</div>
									<div class="form-group">
										<label for="pwd">Password:</label> <input type="password"
											class="form-control password" id="password" name="password"
											placeholder="Password">
									</div>
									<br>
									<!-- include captcha started-->

									<div class="form-group">


										<%@ include file="../../../authentication/captcha/captcha.jsp"%>

									</div>



									<!-- include captcha finished-->

									<div class="checkbox col col-xs-12">
										<label> <input type="checkbox" id="rememberMe"
											name="rememberMe"> Remember me
										</label>
									</div>
									<span class="pull-right"> <br /> <input
										disabled="disabled" autocomplete="false" type="submit"
										class="btn btn-dark btn-lg" id="login" value="Signin"
										onclick="ValidateForm()"> <input type="Reset"
										class="btn btn-dark btn-lg">
									</span>
								</div>
								<div class="panel-footer my-footer">
									<!-- this area for show error message -->
									<%@ include
										file="../../../authentication/action/action_message/action_message.jsp"%>
									<%@ include
										file="../../../authentication/signin/ajax/ajax_sign_in_action_message/ajax_sig_in_error_message.jsp"%>
								</div>
							</div>
						</div>
						<!-- / Signin Panel-->

						<!-- Request Registration Panel -->
						<div id="registration-panel"
							class="panel login-panel hidden-panel">
							<div class="panel-heading my-heading">Request</div>
							<div class="panel-body">
								<form action="registerRequest" method="post">
									<div class="form-group">
										<label for="userName">Message:</label>
										<textarea class="form-control" placeholder="your message ..."
											id="request_content" name="request_content"></textarea>
									</div>
									<div class="form-group">
										<label for="pwd">User name:</label><input type="text"
											name="request_user_name" placeholder="user name ..."
											id="requst_user_name" class="form-control">
									</div>
									<div class="form-group">
										<label for="pwd">Email:</label><input type="email"
											name="request_user_email" placeholder="Email ..."
											id="request_user_email" class="form-control">
									</div>
									<span class="pull-right"> <br /> <input type="button"
										class="btn btn-dark btn-lg" id="register" value="Register">
										<input type="Reset" class="btn btn-dark btn-lg">
									</span>
								</form>
							</div>
							<div class="panel-footer my-footer">
								<%@ include
									file="../../../authentication/request_for_registeration/action_message/action_message.jsp"%>
								<%@ include
									file="../../../authentication/request_for_registeration/ajax/ajax_register_action_message/ajax_register_error_message.jsp"%>
								<%@ include
									file="../../../authentication/request_for_registeration/ajax/ajax_register_action_message/ajax_register_error_message.jsp"%>
							</div>
						</div>
						<!-- /Request Registration Panel -->
					</div>
					<!--/ Panels -->

				</div>
			</div>
		</div>
	</header>
	<!-- /Header -->

	<!--About-->
	<section id="about">
		<div class="container">
			<div class="row">
				<div class="col-sm-8">
					<h2>Knowledge Management System:</h2>
					<h4>What it will be used for?</h4>
					<p>Knowledge management (KM) is the process of capturing,
						developing, sharing, and effectively using organizational
						knowledge. It refers to a multi-disciplinary approach to achieving
						organizational objectives by making the best use of knowledge.</p>
					<a class="btn btn-success " href="#">Read More...</a>
				</div>
				<div class="col-sm-4">
					<span class="glyphicon glyphicon-signal logo slideanim"></span>
				</div>
			</div>
		</div>
	</section>

	<!--Parallax Image-->
	<div class="parallax second-parallax"></div>

	<!--Contact -->
	<section id="contact">

		<!-- Contact Form -->
		<div class="container-fluid bg-grey">
			<div id="contact-form">
				<h2 class="text-center">CONTACT</h2>
				<div class="row">
					<div class="col-sm-5">
						<p>Contact us and we'll get back to you within 24 hours.</p>
						<p>
							<span class="glyphicon glyphicon-map-marker"></span> Zanjan, IR
						</p>
						<p>
							<span class="glyphicon glyphicon-phone"></span> +00 1515151515
						</p>
						<p>
							<span class="glyphicon glyphicon-envelope"></span>
							myemail@something.com
						</p>
					</div>
					<div class="col-sm-7">
						<div class="row">
							<div class="col-sm-6 form-group">
								<input class="form-control" id="name" name="name"
									placeholder="Name" type="text" required>
							</div>
							<div class="col-sm-6 form-group">
								<input class="form-control" id="email" name="email"
									placeholder="Email" type="email" required>
							</div>
						</div>
						<textarea class="form-control" id="comments" name="comments"
							placeholder="Comment" rows="5"></textarea>
						<br>
						<div class="row">
							<div class="col-sm-12 form-group">
								<button class="btn btn-default pull-right" type="submit">Send</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--Contact Form -->

		<!--Google Map -->
		<div id="googleMap"></div>
	</section>

	<!-- Footer -->
	<footer class="text-center">
		<a class="up-arrow" href="#index" data-toggle="tooltip" title="TO TOP">
			<span class="glyphicon glyphicon-chevron-up"></span>
		</a><br> <br>
		<p>Copyright &copy; summer 2016 - 2017</p>
	</footer>



	<!-- content -->
	<!-- including java script file -->
	<%@ include file="../include/js_home_page_includs.jsp"%>


	<!-- including java script file -->
	<%@ include
		file="../../../authentication/signin/include/js_includes.jsp"%>


	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"
		type="text/javascript"></script>
	<script src="mcaptcha/js/jquery.motionCaptcha.0.2.js"></script>

	<!-- after adding error page on this pages we must add the AJAX controller for action in this section-->
	<div style="visibility: hidden;">
		<%@ include
			file="../../../authentication/signin/ajax/ajax_request_for_sign_in/ajax_sign_in.jsp"%>
		<%@ include
			file="../../../authentication/request_for_registeration/ajax/ajax_request_for_register/ajax_register.jsp"%>
	</div>



</body>
</html>