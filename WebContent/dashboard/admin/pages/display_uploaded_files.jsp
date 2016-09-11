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
								<h1>Uploaded files</h1>
							</div>


							<!-- ------------------------ time line -->
							<div class="col-xs-12 col-sm-10 col-sm-offset-1">
								<div class="timeline-container">

									<div class="timeline-label">
										<span class="label label-primary arrowed-in-right label-lg">
											<b>Uploaded filse</b>
										</span>
									</div>

									<s:iterator status="stat" value="files">
										<form action="downloadFile" method="post">


											<div class="timeline-items">

												<div class="timeline-item clearfix">
													<div class="timeline-info">
														<i
															class="timeline-indicator ace-icon fa fa-file-o btn btn-inverse no-hover"></i>
													</div>

													<div class="widget-box widget-color-dark">
														<div class="widget-header widget-header-small">
															<h5 class="widget-title smaller">
																<s:property value="fileName"></s:property>
															</h5>

															<span class="widget-toolbar no-border"> <i
																class="ace-icon fa fa-clock-o bigger-110"></i> <s:property
																	value="date" />
															</span> <span class="widget-toolbar"> <a href="#"
																data-action="collapse"> <i
																	class="ace-icon fa fa-chevron-up"></i>
															</a>
															</span>
														</div>

														<div class="widget-body">
															<div class="widget-main">
																<p>
																	UserName :
																	<s:property value="userName" />
																	<br /> File heading :
																	<s:property value="heading" />
																</p>
																<div class="fileLocationDiv">
																	<input class="form-control" type="text"
																		value=<s:property value="fileLocation"/>
																		name="fileLocation">
																</div>

																<br /> <input type="submit" class="btn btn-inverse"
																	value="Download">

															</div>
														</div>
													</div>
												</div>
											</div>

										</form>
									</s:iterator>

								</div>
							</div>
							<!-- ------------------/ end time line -->

						</div>
						<!-- PAGE CONTENT ENDS -->
					</div>
				</div>
			</div>
			<div style="visibility: hidden;">
				<!-- this page include the action message but it is high in class ajaxUserPage.js -->
				<%@ include
					file="../../../authentication/action/action_message/action_message.jsp"%>
				<%@ include
					file="../../../authentication/signout/ajax/ajax_sign_out_action_message/ajax_sign_out_error_message.jsp"%>

			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->
		<!-- footer -->
		<%@ include file="../includs/new_footer/new_footer.jsp"%>
	</div>
	<!-- /.page-content -->

	<!-- this JS file control the user page actions -->
	<%@ include
		file="../includs/template/new_js_admin_dashboard_include.jsp"%>

	<script src="dashboard/admin/js/admin_page_control/control.js"></script>

	<!-- ajax -->
	<script
		src="authentication/signout/ajax/ajax_request_for_sign_out/ajax_sign_out.js"></script>


	<script type="text/javascript">
		$(function name() {
			$(".fileLocationDiv").hide();
		});
	</script>
</body>
</html>