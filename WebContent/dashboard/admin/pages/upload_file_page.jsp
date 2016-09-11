<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>AdminPage</title>
<link rel="icon" type="image/jpg" href="images/title.jpg">

<%@ include
	file="../includs/template/new_css_admin_dashboard_include.jsp"%>

</head>
<!-- /head -->
<body class="no-skin">

	<!-- navigation bar -->
	<%@ include file="../includs/new_side_bar_and_nav_bar/new_nave_bar.jsp"%>

	<div class="main-container ace-save-state" id="main-container">

		<!-- side bar -->
		<%@ include
			file="../includs/new_side_bar_and_nav_bar/new_side_bar.jsp"%>


		<div class="main-content">
			<div class="main-content-inner">

				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
							<!-- PAGE CONTENT BEGINS -->
							
							<!-- heading -->
							<div class="page-header">
								<h1>Upload file</h1>
							</div>

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
													value=<s:property value="#session.user.userName" />
													disabled name="userName">
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
												<textarea class="form-control"
													placeholder="File Heading ..." name="heading" rows="3"></textarea>
											</div>
											<div class="col col-xs-12">
												<br /> <input type="submit" value="SaveFile"
													class="btn btn-block btn-danger fa fa-fa-save">
											</div>

											<div class="keep">
												<input type="text" name="fileName" id="uploadFileName">
											</div>

										</form>

									</div>
								</div>
							</div>

							<!-- PAGE CONTENT ENDS -->
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.page-content -->

			</div>
		</div>

		<!-- footer -->
		<%@ include file="../includs/new_footer/new_footer.jsp"%>

	</div>
	<!-- /.main-container -->
	<div style="visibility: hidden;">
		<!-- this page include the action message but it is high in class ajaxUserPage.js -->
		<!-- this page include the action message but it is high in class ajaxUserPage.js -->
		<%@ include
			file="../../../authentication/action/action_message/action_message.jsp"%>
		<%@ include
			file="../../../authentication/signout/ajax/ajax_sign_out_action_message/ajax_sign_out_error_message.jsp"%>
	</div>

	<!-- this JS file control the user page actions -->
	<%@ include
		file="../includs/template/new_js_admin_dashboard_include.jsp"%>

	<script src="dashboard/admin/js/admin_page_control/control.js"></script>

	<!-- this JS file control the user page actions -->
	<script
		src="authentication/signout/ajax/ajax_request_for_sign_out/ajax_sign_out.js"></script>

	<script src="dashboard/admin/js/admin_page_control/control.js"></script>

	<script type="text/javascript">
		$(".keep").hide();
		$(document).ready(function() {
			$('input[type="file"]').change(function(e) {
				var fileName = e.target.files[0].name;
				$("#uploadFileName").val(fileName);
			});
		});
	</script>
</body>
</html>