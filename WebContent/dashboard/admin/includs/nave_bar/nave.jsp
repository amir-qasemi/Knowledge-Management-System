<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>

<!-- Navigation -->
<nav class="navbar navbar-default navbar-static-top" role="navigation"
	style="margin-bottom: 0">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".navbar-collapse">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="#">AdminDashbord</a>
	</div>
	<!-- /.navbar-header -->

	<ul class="nav navbar-top-links navbar-right">
		<li class="dropdown"><a class="dropdown-toggle"
			data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
				<i class="fa fa-caret-down"></i>
		</a>
			<ul class="dropdown-menu dropdown-user">
				<li>
					<form action="seeList" method="post">
						<button type="submit" class="btn btn-info" id="seeList">
							<i class="fa fa-user fa-fw"></i>userProfile
						</button>
					</form>
				</li>
				<li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a></li>
				<li class="divider"></li>
				<li><button type="button" class="btn btn-danger signout"
						value="SignOut" id="submit">
						<i class="fa fa-sign-out fa-fw"></i> Signout
					</button></li>
			</ul> <!-- /.dropdown-user --></li>
		<!-- /.dropdown -->
	</ul>
	<!-- /.navbar-top-links -->

	<div class="navbar-default sidebar" role="navigation">
		<div class="sidebar-nav navbar-collapse">
			<ul class="nav" id="side-menu">
				<li class="sidebar-search">
					<div class="input-group custom-search-form">
						<input type="text" class="form-control" placeholder="Search...">
						<span class="input-group-btn">
							<button class="btn btn-default" type="button">
								<i class="fa fa-search"></i>
							</button>
						</span>
					</div> <!-- /input-group -->
				</li>

				<!-- --------------------------------------------------- -->
				<li>
					<form action="dashboardRedirect" method="post">
						<button type="submit" class="btn btn-link btn-outline"
							style="color: darkblue; text-decoration: none;">
							<i class="fa fa-dashboard fa-fw"></i> &nbsp; Dashboard
						</button>
					</form>
				</li>
				<li>
					<form action="seeMesaages" method="post">
						<button type="submit" class="btn btn-link btn-outline"
							style="color: darkblue; text-decoration: none;">
							<i class="fa fa-envelope-o"></i> &nbsp; Messages
						</button>
					</form>
				</li>
				<li>
					<form action="seeUploadedFiles" method="post">
						<button type="submit" class="btn btn-link btn-outline"
							style="color: darkblue; text-decoration: none;">
							<i class="fa fa-files-o"></i> &nbsp; Files
						</button>
					</form>
				</li>
				<li>
					<form action="sendMessageRedirect" method="post">
						<button type="submit" class="btn btn-link btn-outline"
							style="color: darkblue; text-decoration: none;">
							<i class="fa fa-bullhorn"></i> &nbsp; Add comment
						</button>
					</form>
				</li>
				<li>
					<form action="sendFileRedirect" method="post">
						<button type="submit" class="btn btn-link btn-outline"
							style="color: darkblue; text-decoration: none;">
							<i class="glyphicon glyphicon-save"></i> &nbsp; Add file
						</button>
					</form>
				</li>
				<li>
					<form action="wikiPage" method="post">
						<button type="submit" class="btn btn-link btn-outline"
							style="color: darkblue; text-decoration: none;">
							<i class="fa fa-stack-overflow"></i> &nbsp; wiki
						</button>
					</form>
				</li>
				<!-- --------------------------------------------------- -->

				<li class="active"><a href="#"><i
						class="fa fa-files-o fa-fw"></i> Other Pages<span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a class="active" href="Registration.jsp">Sign up
								Page</a></li>
						<li><a href="Login.jsp">Sign in Page</a></li>
					</ul> <!-- /.nav-second-level --></li>
			</ul>
		</div>
		<!-- /.sidebar-collapse -->
	</div>
	<!-- /.navbar-static-side -->
</nav>