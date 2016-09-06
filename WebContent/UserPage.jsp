<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>UserPage</title>

<!-- include bootstrap file -->

</head>
<!-- /head -->
<body>

	<section class="content">

		<div class="content row">

			<section class="main col col-lg-12">

				<section class="content col col-lg-12">

					<!-- Page Content -->
					<section class="col-lg-12">
						<h1>User Profile</h1>
						<ul class="nav nav-pills">
							<li class="active"><a data-toggle="pill" href="#home">Home</a></li>
							<li><a data-toggle="pill" href="#editUsername">Edit
									UserName</a></li>
							<li><a data-toggle="pill" href="#editPassword">Edit
									Password</a></li>
							<li><input type="button"
								class="btn btn-outline btn-outline btn-primary btn-default"
								value="SignOut" id="submit"></li>
						</ul>

						<div class="tab-content">
							<div id="home" class="tab-pane fade in active">
								<br></br>
								<h4>
									User Name :
									<s:property value="#session.user.userName" />
								</h4>
								<h4>
									Password :
									<s:property value="#session.user.password" />
								</h4>
								<h4>
									E-mail :
									<s:property value="#session.user.email" />
								</h4>
							</div>
							<div id="editUsername" class="tab-pane fade">
								<br></br>
								<div class="form-group col-xs-8">
									<label class="control-label col-sm-2" for="username">New
										userName :</label>
									<div class="col-sm-9">
										<input type="text" class="form-control col-sm-offset-2" id="email"
											placeholder="Enter new username">
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-10">
										<button type="submit" class="btn btn-success">Submit
											changes</button>
									</div>
								</div>
							</div>
							<div id="editPassword" class="tab-pane fade">
								<br></br>
								<div class="form-group">
									<label class="control-label col-sm-2" for="pwd">New
										Password :</label>
									<div class="col-sm-9">
										<input type="password" class="form-control" id="email"
											placeholder="Enter new password">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-2" for="pwd">Confirm
										:</label>
									<div class="col-sm-9">
										<input type="password" class="form-control" id="email"
											placeholder="Confirm new password">
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-10">
										<button type="submit" class="btn btn-success">Submit
											changes</button>
									</div>
								</div>
							</div>
						</div>
					</section>

					<!-- this page include the action message but it is high in class ajaxUserPage.js -->
					<%@ include file="ajax/ajaxSignOutActionMessage/ajaxSignOutErrorActionMessage.jsp"%>

				</section>

			</section>
			<!-- main -->

		</div>
		<!-- content row -->
	</section>
	<!-- content -->

	<!-- including java script file -->

	<!-- this JS file control the user page actions -->
	<script src="ajax/userPage/ajaxUserPage.js"></script>

</body>
</html>