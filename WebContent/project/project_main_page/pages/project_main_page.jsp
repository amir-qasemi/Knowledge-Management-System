<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><s:property name="project"/></title>



<!-- CSS includes files -->
<%@ include file="../../includs/templates/css_include_files.jsp"%>
</head>
<body class="no-skin">

	<div id="wrapper">
		<!-- including navigation bar -->
		<%@ include file="../../includs/nave_bar/project_nav_bar.jsp"%>

		<div class="main-container ace-save-state" id="main-container">


			<div class="col col-xs-4">

				<!-- include side bar -->
				<%@ include file="../../includs/side_bar/project_side_bar.jsp"%>

			</div>

			<div class="main-content">
				<div class="main-content-inner">

					<div class="page-content">
						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->

								<!-- ----------- page content -->

								

								<!-- -----------/ page content -->

								<!-- ------------------------/ project body -->
								<div style="visibility: hidden;">
									<!-- this page include the action message but it is high in class ajaxUserPage.js -->
									<%@ include
										file="../../../authentication/action/action_message/action_message.jsp"%>
									<%@ include
										file="../../../authentication/signout/ajax/ajax_sign_out_action_message/ajax_sign_out_error_message.jsp"%>
								</div>

								<!-- PAGE CONTENT ENDS -->
							</div>
							<!-- /.col -->
						</div>
						<!-- /.row -->
						<!-- footer -->
						<%@ include
							file="../../../dashboard/admin/includs/new_footer/new_footer.jsp"%>
					</div>
					<!-- /.page-content -->
				</div>
			</div>

		</div>
	</div>

	<!-- JS includes files -->
	<%@ include file="../../includs/templates/js_include_files.jsp"%>

	<!-- ad AJAX for sign out -->
	<script
		src="authentication/signout/ajax/ajax_request_for_sign_out/ajax_sign_out.js"></script>

</body>
</html>