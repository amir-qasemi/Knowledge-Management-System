<!-- Author: Mehdi Eskandari -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>create new wiki Page</title>
<link rel="icon" type="image/jpg" href="images/title.jpg">

<!-- include bootstrap file -->
<%@ include file="../includs/template/css_includs_template.jsp"%>

</head>
<body style="background-color: white">

	<div id="wrapper">


		<!-- including navigation bar -->
		<%@ include file="../includs/nav_bar/wiki_nav_bar.jsp"%>


		<div class="col col-xs-4">

			<!-- include side bar -->
			<%@ include file="../includs/side_bar/wiki_side_bar.jsp"%>

		</div>

		<!--Page Content -->
		<div id="page-content-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<div class="col-lg-12">
							<a href="#menu-toggle" id="menu-toggle"
								class="fa fa-angle-double-left"></a>
						</div>
						<div class="col-xs-12">
							<div class="col-xs-12">

								<div class="EditorDiv" id="EditorDiv">
									<div class="col col-xs-12">
										<div class="panel panel-primary" id="visualEditor">
											<div class="panel-heading">
												<h4>
													Add a page : <i
														class="glyphicon glyphicon-pencil pull-right"
														style="line-height: 5px; font-size: 36px"></i>
												</h4>
											</div>
											<div class="panel-body">
												<form action="createNewWikiPage" method="post">
													<input type="text" name="title" placeholder="Set the title"
														class="form-control" style="border-color: blue;">
													<br>
													<textarea name="editor1" id="editor1" rows="10" cols="80"></textarea>
													<br>
													<div class="pull-right">
														<input type="submit" style="visibility: hidden;">
														<button class="btn btn-primary" id="saveChangesBtn">Save</button>
														<button class="btn btn-danger" id="cancelChangesBtn">Cancel</button>
													</div>
												</form>
											</div>
										</div>

										<script src="visual_editor/ckeditor/ckeditor.js"></script>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /#page-content-wrapper-->

	</div>

	<!-- page JQuery is in this page -->
	<%@ include
		file="../js/create_new_wiki_page/control/create_new_wiki_page_control.jsp"%>

	<!-- ad AJAX for sign out -->
	<script
		src="authentication/signout/ajax/ajax_request_for_sign_out/ajax_sign_out.js"></script>

</body>
</html>