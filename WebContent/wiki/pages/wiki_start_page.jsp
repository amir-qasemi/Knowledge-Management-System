<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Wiki home page</title>

<!-- include bootstrap file -->
<%@ include file="../includs/template/css_includs_template.jsp"%>

<!-- custom style for wiki start page -->
<link rel="stylesheet"
	href="wiki/css/custom_style/wiki_start_page_custom_style.css">

<!-- auto compleate style -->
<link rel="stylesheet"
	href="wiki/css/auto_compleate/jquery.auto-complete.css">

</head>
<!-- header -->
<body id="home" style="background-color: white">

	<div id="wrapper">
		<!-- including navigation bar -->
		<%@ include file="../includs/nav_bar/wiki_nav_bar.jsp"%>

		<div class="col col-xs-4">

			<!-- include side bar -->
			<%@ include file="../includs/side_bar/wiki_side_bar.jsp"%>

		</div>
		<br /> <br /> <br />
		<section class="col-md-6 col-md-offset-4 loginPanel">
			<div class="panel panel-green panel-addmessage">
				<div class="panel-heading">
					<div class="row">
						<div class="col-xs-3">
							<i class="fa fa-search fa-5x"></i>
						</div>
						<div class="col-xs-9 text-right">
							<div>Search wiki for results</div>
						</div>
					</div>
				</div>

				<div class="panel-body">
					<form action="serachAction" method="post">
						<input id="hero-demo" name="search" autofocus type="text"
							placeholder="Serach ..."> <br> <span
							class="pull-right"> <br>
							<div class="btn-group">
								<button type="submit" id="submit" class="btn btn-success">
									Search <i class="glyphicon glyphicon-ok"></i>
								</button>
								<button type="Reset" class="btn btn-danger">
									Cancle <i class="glyphicon glyphicon-remove"></i>
								</button>
								<button type="button" id="createWiki" class="btn btn-warning">
									Create new wiki page <i class="fa fa-edit"></i>
								</button>
							</div>
						</span>
					</form>
				</div>
			</div>

			<!-- receiving the list of titles in here -->
			<s:hidden id="list" value="%{titels}" />

		</section>
		<div class="row"></div>

		<div style="visibility: hidden;" class="wikiRedirectDive">
			<form action="createNewWikiRedirect" method="post">
				<input type="submit" id="createWikiRedirectSubmit"
					class="wikiPageSubmit">
			</form>
		</div>
	</div>

	<!-- including java script file -->
	<%@ include file="../includs/template/js_includs_templates.jsp"%>
	<script
		src="wiki/js/wiki_start_page/auto_compleate/jquery.auto-complete.js"></script>
	<%@ include
		file="../../wiki/js/wiki_start_page/control/wiki_start_page_auto_compleate_controler.jsp"%>

	<!-- ad AJAX for sign out -->
	<script
		src="authentication/signout/ajax/ajax_request_for_sign_out/ajax_sign_out.js"></script>

</body>
</html>